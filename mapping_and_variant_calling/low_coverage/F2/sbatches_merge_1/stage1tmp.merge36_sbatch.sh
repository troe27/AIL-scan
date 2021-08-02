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
bcftools merge /home/tilman/storage2/F2/data/1377_F2_S32_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_364_S87_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_682_S48_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_884_S33_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_865_S16_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1012_S50_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_796_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1177_S8_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_942_S80_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_620_S86_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.36.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.36.vcf.bgz