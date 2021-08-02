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
bcftools merge /home/tilman/storage/F18/data/F18_2952_S46_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_3035_S64_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_3042_S115_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2966_S47_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_3009_S58_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2972_S48_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1917_S92_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1979_S24_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1942_S7_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_3008_S57_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2974_S49_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz