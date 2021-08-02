#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge84
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge84_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge84_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2736_S33_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3175_S70_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2765_S64_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2886_S89_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2763_S50_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2566_S37_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2754_S61_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2980_S78_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3019_S11_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2509_S30_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.84.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.84.vcf.bgz