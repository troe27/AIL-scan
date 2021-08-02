#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1
#SBATCH -o ./sbatches_merge_1_%j.out
#SBATCH -e ./sbatches_merge_1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
bcftools merge /home/tilman/storage2/F2/data/F2_1199_S29_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_184_S11_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1027_S63_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1387_F2_S41_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_923_S65_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1112_S48_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_960_S96_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1149_S79_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1015_S53_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_609_S75_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.44.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.44.vcf.bgz