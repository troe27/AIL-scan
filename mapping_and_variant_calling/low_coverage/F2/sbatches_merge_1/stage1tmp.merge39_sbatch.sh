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
bcftools merge /home/tilman/storage2/F2/data/F2_353_S76_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_546_S18_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_941_S79_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_586_S53_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_635_S4_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_880_S30_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_645_S14_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_418_S15_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1161_S89_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1353_F2_S19_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.39.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.39.vcf.bgz