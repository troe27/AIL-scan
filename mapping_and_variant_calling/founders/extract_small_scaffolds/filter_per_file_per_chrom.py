"""
filter individual g.vcf based on chromosome names
"""
from cyvcf2 import VCF, Writer
import os
import argparse

def cli():
    parser = argparse.ArgumentParser()
    parser.add_argument('-i','--infile',help="gvcf",type=str,required=True)
    parser.add_argument('-o','--outprefix',help='filtered gvcf',type=str,required=True)
    parser.add_argument('-c','--chrom',help='chromosome name',type=str,required=True)
    parser.add_argument('-t','--threads',help='number of threads',type=int,required=True)
    args = parser.parse_args()
    return args

def filter_gvcf_by_chrom(infile,outfile, chrom, keep=True, threads=3):
    vcf = VCF(infile,threads=threads)
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
    outfile = args.outprefix+"_filtered_by_"+args.chrom+args.infile.rsplit("/",1)[1]
    filter_gvcf_by_chrom(infile=args.infile,outfile=outfile, chrom=args.chrom, threads=args.threads)

if __name__ == "__main__":
    main()
