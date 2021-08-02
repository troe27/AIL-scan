from cyvcf2 import VCF
infile="/Users/tilro532/rackstore/F2/all_f2_only_founder_snps_new_names.vcf"
outfile="sample_names_F2_new.txt"

vcf = VCF(infile, threads=2)
l = vcf.samples

with open(outfile, "w") as handle:
    for sample in l:
        handle.write(sample+"\n")
