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
bcftools merge /home/tilman/storage/F18/data/F18_1897_S84_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1978_S23_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1996_S31_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1902_S86_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1959_S16_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2943_S44_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1948_S9_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_3022_S62_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1925_S1_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2979_S51_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz