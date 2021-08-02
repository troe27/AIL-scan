"""
filter a folder of g.vcfs based on contig-names
tilman.ronneburg@imbim.uu.se
"""
from cyvcf2 import VCF, Writer
import os
import argparse

def cli():
    parser = argparse.ArgumentParser()
    parser.add_argument('-i','--indir',help='directory for all the individuals',type=str,required=True)
    parser.add_argument('-o','--outdir',help='A folder to put the outputs',type=str,required=True)
    parser.add_argument('-c','--chrom',help='chromosome name',type=str,required=True)
    parser.add_argument('-t','--threads',help='number of threads',type=str,required=True)
    args = parser.parse_args()
    return args

def filter_gvcf_by_chrom(infile,outfile, chrom, keep=True, threads=3):
    vcf = VCF(filename,threads=threads)
    w = Writer(outfile, vcf)
    if keep == True:
        for v in vcf:
            if str(v.CHROM).startswith(chrom):
                w.write_record(v)
    else:
        for v in vcf:
            if not str(v.CHROM).startswith(chrom):
                w.write_record(v)

    w.close(); vcf.close()
    
def main():
    args = cli()
    file_list = os.listdir(args.indir)
    for f in file_list:
        base = f.rsplit("/",1)[1].rsplit(".",2)[0]
        outfile = args.outdir+"/"+base+"_filtered_only_"+args.chrom+".g.vcf"
        filter_gvcf_by_chrom(infile=f,outfile=outfile, chrom=args.chrom, threads=args.threads)

if __name__ == "__main__":
    main()
