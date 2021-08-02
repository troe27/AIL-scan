#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge93
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge93_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge93_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3207_S59_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2843_S94_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2788_S32_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2450_S17_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2912_S52_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2394_S47_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2387_S42_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8331_S13_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2996_S92_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2464_S4_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.93.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.93.vcf.bgz