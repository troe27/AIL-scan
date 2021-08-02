#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge36
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge36_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge36_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2777_S32_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2899_S29_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2717_S17_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3083_S60_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2607_S6_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8190_S104_L003.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2472_S10_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2965_S66_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2473_S23_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3051_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.36.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.36.vcf.bgz