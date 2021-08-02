#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge8
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge8_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge8_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2779_S64_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3057_S39_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2502_S26_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2816_S72_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2993_S89_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8123_S92_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2401_S52_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2388_S12_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3082_S59_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8603_S64_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.8.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.8.vcf.bgz