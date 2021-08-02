#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge75
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge75_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge75_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2479_S24_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2989_S86_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3327_S61_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2555_S67_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2724_S24_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3052_S57_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3199_S51_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8165_S89_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2421_S68_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3030_S21_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.75.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.75.vcf.bgz