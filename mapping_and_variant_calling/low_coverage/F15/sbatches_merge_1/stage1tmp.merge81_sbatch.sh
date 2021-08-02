#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge81
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge81_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge81_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_8281_S90_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3163_S23_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2844_S95_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3178_S34_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2432_S78_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3261_S69_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8347_S72_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3156_S68_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2511_S34_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2928_S78_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.81.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.81.vcf.bgz