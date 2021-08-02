#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge69
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge69_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge69_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2599_S93_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2335_S58_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3304_S40_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3281_S21_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2961_S64_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2713_S54_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3120_S64_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2474_S11_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3168_S92_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2460_S1_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.69.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.69.vcf.bgz