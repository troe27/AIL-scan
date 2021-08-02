import os
import subprocess
import argparse
import numpy as np
conda_env="v3"
def cli_parser():
    '''
    parses command line input
   
    '''
    parser_main = argparse.ArgumentParser(prog='create_merge.py')
    parser_main.add_argument("--infolder",
                             help="path to the folder that contains the vcf files that should be merged",
                             required = True)
    parser_main.add_argument("--prefix",
                             help="path/prefix of the VCF file that will be the output",
                             required = True,default="mergeVCFs")
    parser_main.add_argument("--make_sbatch",
                             help=" if flag, create sbatch_file with --threads  a 6  GB ram on 185 hours. ",
                             action='store_true')
    parser_main.add_argument("--threads",
                             help=" number of threads to run each job. ",
                             default=1)
    parser_main.add_argument("--bcftools_path",
                             help="path to bcftools ",
                             )
    parser_main.add_argument("--scriptprefix",
                             help="batchsize",
                             default=10
                             )

    parser_main.add_argument("--batchsize",
                             help="batchsize",
                             default=10
                             )

    args = parser_main.parse_args()
    return args


def construct_script(batch, outname, bcftools, threads, infolder):
    out = outname+".vcf.bgz"
    full_batch = [os.path.join(infolder,f) for f in batch] 
    script_items = [str(bcftools),
                                       "merge"," ".join(full_batch),
                                       "-O", "z",
                                       "--threads", threads,
                                       "-o", out,
                                       "&& tabix -p vcf", out,]
    return script_items
    

def write_script(script_items, args, outname, scriptname):
    with open(scriptname+".sh", "w") as handle:
        handle.write("#!/bin/bash")
        handle.write(" ".join(script_items+"\n"))
    subprocess.call(["chmod", "766", scriptname+".sh"])

def create_sbatch(args, batch, outname, scriptname):
    name=outname
    sbatch_header = [ "#!/bin/bash -l",
                        "#SBATCH -A snic2018-3-170",
                        "#SBATCH -t 48:0:0 ",
                        "#SBATCH -p core -n "+str(args.threads),
                        "#SBATCH -J {name}".format(name=scriptname.rsplit("/",1)[0]),
                        "#SBATCH -o {name}_%j.out".format(name=scriptname.rsplit("/",1)[0]),
                        "#SBATCH -e {name}_%j.error".format(name=scriptname.rsplit("/",1)[0]),
                        "#SBATCH --mail-user tilman.ronneburg@imbim.uu.se",
                        "#SBATCH --mail-type=ALL",
                        "#SBATCH --get-user-env",
                        "##command underneath this##"
                       ]

    load_modules = ["source activate {env}".format(env=conda_env)]
    sclines = construct_script(batch=batch, outname=outname, threads=args.threads,bcftools=args.bcftools_path, infolder=args.infolder )
    
    with open(scriptname+"_sbatch.sh", "w") as handle:
        for line in sbatch_header:
            handle.write(line+"\n")
        for line in load_modules:
            handle.write(line+"\n")
        handle.write(" ".join(sclines))
    subprocess.call(["chmod", "766", str(scriptname)+"_sbatch.sh"])


def main():
    args = cli_parser()
    vcfs = [f for f in os.listdir(args.infolder) if f.endswith(".vcf.bgz")]
    batches = np.array_split(vcfs, len(vcfs)//int(args.batchsize))
    for i, batch in enumerate(batches):
        if args.make_sbatch is True:
            create_sbatch(args=args,
                          batch=batch,
                          outname=args.prefix+".tmp.merge."+str(i),
                          scriptname= args.scriptprefix+"tmp.merge"+str(i))

        else:
            scl = construct_script(args=args,
                                   batch=batch,
                                   outname=args.prefix+".tmp.merge."+str(i),
                                   threads=args.threads,
                                   bcftools=args.bcftools_path,
                                   scriptname=args.scriptprefix+".tmp.merge."+str(i),
                                   infolder=args.infolder)
            write_script(script_items=scl,
                         args=args,
                         outname=args.prefix+".tmp.merge."+str(i))

if __name__ == "__main__":
    main()
