from cyvcf2 import VCF
infile="/Users/tilro532/rackstore/F15/all_f15_only_founder_snps.vcf.bgz"
outfile="sample_names_F15_new.txt"

vcf = VCF(infile, threads=2)
l = vcf.samples
ll = [i.rsplit("/",1)[1] for i in l]
lll = [i.rsplit("_",3)[0] for i in ll]

with open(outfile, "w") as handle:
    for sample in lll:
        handle.write(sample+"\n")
