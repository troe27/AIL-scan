#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge10
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge10_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge10_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3009_S3_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2510_S33_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3180_S36_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/3026_F15_S93_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3149_S14_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3078_S56_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2974_S90_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2436_S81_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2423_S69_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8735_S94_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.10.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.10.vcf.bgz