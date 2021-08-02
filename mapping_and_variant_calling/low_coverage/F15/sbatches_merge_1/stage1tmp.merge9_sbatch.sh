#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge9
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge9_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge9_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3249_S94_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3336_S67_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3330_S63_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2572_S38_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2577_S82_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3200_S52_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8651_S2_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3106_S74_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2905_S33_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2872_S95_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.9.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.9.vcf.bgz