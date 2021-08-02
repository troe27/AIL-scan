#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge50
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge50_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge50_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2526_S45_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2866_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3216_S68_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3105_S55_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3051_S56_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3241_S89_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3104_S73_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3290_S29_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3221_S72_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3270_S13_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.50.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.50.vcf.bgz