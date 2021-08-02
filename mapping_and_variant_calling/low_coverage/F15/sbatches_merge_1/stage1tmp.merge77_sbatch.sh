#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge77
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge77_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge77_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_8129_S99_L003.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3241_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2343_S9_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3068_S48_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2987_S84_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8629_S81_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3140_S5_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2712_S14_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3054_S37_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3332_S78_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.77.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.77.vcf.bgz