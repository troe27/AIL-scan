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
bcftools merge /home/tilman/storage/F18/data/F18_2015_S38_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1891_S81_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1982_S26_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1954_S12_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1905_S88_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1932_S5_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2932_S42_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1930_S4_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1976_S21_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1915_S91_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/3080_F18_S89_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz