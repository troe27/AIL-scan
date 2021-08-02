#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge37
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge37_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge37_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2518_S40_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2943_S84_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2858_S7_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3241_S61_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3278_S18_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8683_S70_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2897_S42_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3111_S78_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2828_S84_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2516_S32_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.37.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.37.vcf.bgz