#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 8
#SBATCH -J ./sbatches_merge_1
#SBATCH -o ./sbatches_merge_1_%j.out
#SBATCH -e ./sbatches_merge_1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
bcftools merge /home/tilman/storage/F16/data/F16_7247_S63_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7337_S4_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7242_S62_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7194_S43_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7233_S58_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7255_S66_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7287_S78_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7315_S89_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7347_S7_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7375_S15_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7207_S48_L008.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz