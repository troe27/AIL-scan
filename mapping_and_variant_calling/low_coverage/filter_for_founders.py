""" Script to filter a vcf file to only contain the Sites in the VCF file supplied as a reference. optionally excludes indels and insertions"""
from cyvcf2 import VCF, Writer
import argparse

def cli_parser():
    '''Parse command line input'''
    parser_main = argparse.ArgumentParser(prog='filter_for_founders.py')
    parser_main.add_argument("-i","--infile",help="input vcf, to be filtered ")
    parser_main.add_argument("-r","--reference",help="reference-vcf")
    parser_main.add_argument("-o","--outfile",help="output vcf, filtered.")
    parser_main.add_argument("-t","--threads",help="number of threads to use.",default=1)
    parser_main.add_argument("-d","--indels",help="filter out all indels", action="store_true")
    args = parser_main.parse_args()
    return args

def filter_via_vcf(infile, reference, outfile, threads, indels=False):
    '''execute filtering'''
    rdict= {}
    ref = VCF(reference, threads=threads)
    for v in ref:
        rdict.setdefault(v.CHROM, {})
        rdict[v.CHROM][v.POS] = True
    vcf = VCF(infile, threads=threads)
    out = Writer(outfile, vcf)
    for v in vcf:
        if v.CHROM in rdict:
            if v.POS in rdict[v.CHROM]:
                if indels == True:
                    if len(v.REF) == 1 and len(v.ALT) == 1:  # filter for only SNPs, no indels
                        out.write_record(v)
                else:
                    out.write_record(v)
    out.close(); vcf.close()

def main():
    args = cli_parser()
    filter_via_vcf(infile=args.infile,
                   reference=args.reference,
                   outfile=args.outfile,
                   threads=int(args.threads),
                   indels=args.indels
                  )
    
if __name__ == "__main__":
    main()
