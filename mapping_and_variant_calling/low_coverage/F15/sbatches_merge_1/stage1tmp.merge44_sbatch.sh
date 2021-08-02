#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge44
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge44_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge44_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3280_S20_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8297_S77_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3051_S35_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2338_S3_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2992_S88_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2885_S40_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3054_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3226_S77_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2468_S26_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3144_S9_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.44.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.44.vcf.bgz