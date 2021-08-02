"""
Create sbatch files to call variants on every g.vcf within the infolder
either as total, or per chromosome, with the --chrom option.
author: tilman.ronneburg@imbim.uu.se
"""
import os
import subprocess
import argparse

def cli_parser():
    '''
    parses command line input
   
    '''
    parser_main = argparse.ArgumentParser(prog='GenotypeGVCF_creator.py')
    parser_main.add_argument("--infolder",
                             help="path to the folder that contains the g.vcf files created with the GATK haplotypecaller",
                             required = True)
    parser_main.add_argument("--outfile",
                             help="path to the VCF file that will be the output",
                             required = True)
    parser_main.add_argument("--reference",
                             help="path to the fasta file that is used as the reference",
                             required = True)
    parser_main.add_argument("--execute",
                             help=" if flag, execute the script after creating it. if --make_sbatch, submits sbatch to Slurm instead.",
			     action='store_true')
    parser_main.add_argument("--script_name",
                             help="name of the script",
                             default="gatk_combineGVCF.sh")
    parser_main.add_argument("--make_sbatch",
                             help=" if flag, create sbatch_file with --threads  a 6  GB ram on 185 hours. ",
                             action='store_true')
    parser_main.add_argument("--threads",
                             help=" number of threads to run this on. ",
                             default=1)

    parser_main.add_argument("--gatk_path",
                             help="path to the gatk jar file ",
                             )
    parser_main.add_argument("--chrom",
                             help="chromosome name",
                             )

    args = parser_main.parse_args()
    return args

def construct_script(args):
    in_abs = os.path.abspath(args.infolder)
    outfile_abs = os.path.abspath(args.outfile)
    ref_abs = os.path.abspath(args.reference)
    dirlist = os.listdir(str(in_abs)+"/")
    processed = [ "--variant "+str(in_abs)+"/"+str(f)+" " for f in dirlist if f.endswith(".g.vcf")]
    script_lines = []
    script_lines.append("java -Xms10g -Xmx64g -jar "+args.gatk_path+" -nt "+str(args.threads)+" -T GenotypeGVCFs ")  # point directly to gatk
    script_lines.append("-R "+str(ref_abs)+" ")
    for line in processed:
        script_lines.append(""+line+" ")
    if args.chrom:
        script_lines.append( "-L "+args.chrom+" ")
        script_lines.append("--out "+str(outfile_abs)+"_"+args.chrom+"_raw.vcf \n")
    else:
        script_lines.append("--out "+str(outfile_abs)+"_raw.vcf \n")
    return script_lines
    
def write_script(script_lines, args):
    script_file = str(args.script_name)
    with open(script_file, "w") as handle:
    	for line in script_lines:
        	handle.write(line)
    subprocess.call("chmod 766 "+str(script_file) , shell=True)

def execute_script(args):
    if args.make_sbatch is True:
        subprocess.call(["sbatch",str(args.script_name)])
    else:
        subprocess.call(["bash", str(args.script_name)])

def create_qsub(args):
    if args.chrom:
    	qsub_header = [ "#!/bin/bash -l",
		        "#SBATCH -A snic2018-3-170",
                    	"#SBATCH -t 5:0:0 ",
		    	"#SBATCH -p core -n "+str(args.threads),
                    	"#SBATCH -J genotypeGVCF",
                    	"#SBATCH -o genotype_GVCF_"+args.chrom+"_%j.out",
                    	"#SBATCH -e genotype_GVCF_"+args.chrom+"_%j.error",
                    	"#SBATCH --mail-user tilman.ronneburg@imbim.uu.se",
                    	"#SBATCH --mail-type=ALL",
                    	"#SBATCH --get-user-env",
                    	"##command underneath this##"
                       ]
    else:
        qsub_header = [ "#!/bin/bash -l",
                        "#SBATCH -A snic2018-3-170",
                        "#SBATCH -t 5:0:0 ",
                        "#SBATCH -p core -n "+str(args.threads),
                        "#SBATCH -J genotypeGVCF",
                        "#SBATCH -o genotype_GVCF_%j.out",
                        "#SBATCH -e genotype_GVCF_%j.error",
                        "#SBATCH --mail-user tilman.ronneburg@imbim.uu.se",
                        "#SBATCH --mail-type=ALL",
                        "#SBATCH --get-user-env",
                        "##command underneath this##"
                       ]

    load_modules = ["module load bioinfo-tools", "module load GATK"] #again, check if your gatk module is named "gatk", and/or choose your preferred version.
    sclines = construct_script(args)
    with open(str(args.script_name)+"_sbatch.sh", "w") as handle:
        for line in qsub_header:
            handle.write(line+"\n")
        for line in load_modules:
            handle.write(line+"\n")
        for line in sclines:
            handle.write(line)
    subprocess.call(["chmod", "766", str(args.script_name)+"_sbatch.sh"])

def main():
    args = cli_parser()
    lines = construct_script(args)
    write_script(lines, args)
    if args.make_sbatch is True:
        create_qsub(args)
    if args.execute is True:
        execute_script(args)
    	
main()
