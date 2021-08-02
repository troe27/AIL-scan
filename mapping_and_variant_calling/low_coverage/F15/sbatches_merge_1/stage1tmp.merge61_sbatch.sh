#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge61
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge61_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge61_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/2375_F15_S86_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3215_S67_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2370_F15_S81_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2877_S17_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3252_S2_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2742_S57_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3058_S40_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2521_S42_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2444_S87_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2419_S67_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.61.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.61.vcf.bgz