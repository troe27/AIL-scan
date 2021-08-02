#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge86
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge86_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge86_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2861_S8_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8257_S89_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2867_S84_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3239_S87_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3224_S75_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3110_S77_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2434_S80_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2453_S93_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2339_S6_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2721_S21_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.86.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.86.vcf.bgz