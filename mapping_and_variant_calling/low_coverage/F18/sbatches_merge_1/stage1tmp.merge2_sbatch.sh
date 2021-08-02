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
bcftools merge /home/tilman/storage/F18/data/F18_2013_S37_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2024_S40_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1906_S89_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1987_S28_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1884_S78_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1960_S17_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_3034_S63_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2984_S52_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1970_S19_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1977_S22_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2999_S56_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz