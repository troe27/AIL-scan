#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge58
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge58_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge58_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2773_S67_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2589_S86_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2564_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2431_S77_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3040_S28_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3267_S11_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3182_S38_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2557_S69_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2553_S65_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2994_S90_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.58.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.58.vcf.bgz