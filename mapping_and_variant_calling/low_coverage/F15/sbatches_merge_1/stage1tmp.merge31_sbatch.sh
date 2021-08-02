#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge31
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge31_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge31_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3125_S89_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2344_S10_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3231_S82_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3004_S44_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3325_S59_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2544_S59_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2826_S82_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8231_S5_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2587_S45_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3133_S66_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.31.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.31.vcf.bgz