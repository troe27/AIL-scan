#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge23
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge23_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge23_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2331_S1_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2396_S59_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2933_S80_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2997_S93_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8203_S77_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2834_S87_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2821_S38_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3023_S15_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2601_S1_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2532_S50_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.23.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.23.vcf.bgz