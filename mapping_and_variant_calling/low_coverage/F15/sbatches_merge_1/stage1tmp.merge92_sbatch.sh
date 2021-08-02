#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge92
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge92_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge92_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2862_S9_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3184_S40_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2538_S53_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3090_S61_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3096_S68_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2449_S91_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2868_S14_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2389_S43_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3129_S65_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2962_S88_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.92.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.92.vcf.bgz