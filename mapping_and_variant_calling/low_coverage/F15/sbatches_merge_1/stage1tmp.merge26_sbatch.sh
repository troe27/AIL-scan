#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge26
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge26_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge26_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/2753_F15_S92_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8183_S93_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2813_S78_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8328_S69_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2760_S63_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8309_S11_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3276_S16_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2914_S36_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2957_S87_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2378_S35_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.26.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.26.vcf.bgz