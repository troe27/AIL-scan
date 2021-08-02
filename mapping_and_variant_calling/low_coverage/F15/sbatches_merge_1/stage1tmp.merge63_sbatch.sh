#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge63
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge63_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge63_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2465_S5_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2580_S40_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3130_S93_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3240_S88_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3346_S79_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3308_S43_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2429_F15_S65_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2873_S85_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2814_S29_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3158_S18_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.63.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.63.vcf.bgz