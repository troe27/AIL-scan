#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge76
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge76_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge76_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2398_S49_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3248_S93_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3079_S57_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2406_S14_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2921_S96_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3146_S11_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2471_S9_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3187_S42_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3035_S24_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2574_S80_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.76.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.76.vcf.bgz