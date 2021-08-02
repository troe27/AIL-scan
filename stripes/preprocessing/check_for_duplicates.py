from cyvcf2 import VCF
from collections import Counter

infile = "all_f8_only_founder_snps.vcf.bgz"

vcf = VCF(infile, threads=5)

sample = vcf.samples

sampl = [i.rsplit("/",1)[1] for i in sample]
sampl = [i.split("_")[0] for i in sampl] # adjust this if naming convention of files differs

d=dict(Counter(sampl))
#get all samples that are duplicates
dups = [key for key, item in d.items() if item>1]

for duplicate in dups:
    print(duplicate)
    !find . -name *{duplicate}* #ipython, because i cant be bothered to use os right now
