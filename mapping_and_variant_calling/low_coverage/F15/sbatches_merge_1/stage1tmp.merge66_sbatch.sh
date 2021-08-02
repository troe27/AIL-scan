#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge66
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge66_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge66_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2400_S51_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3289_S28_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2869_S15_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3043_S51_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8243_S7_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2745_S40_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3293_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3197_S49_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2426_S72_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2728_S27_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.66.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.66.vcf.bgz