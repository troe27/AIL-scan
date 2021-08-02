#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge34
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge34_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge34_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3218_S70_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2891_S90_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2922_S77_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3074_S52_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2836_S89_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2841_S93_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3052_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2575_S81_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3212_S64_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2345_S5_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.34.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.34.vcf.bgz