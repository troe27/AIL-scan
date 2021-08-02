#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge80
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge80_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge80_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2741_S38_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3169_S28_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2605_S49_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2955_S86_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3061_S43_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3127_S91_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2723_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3002_S94_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2770_S65_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3029_S20_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.80.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.80.vcf.bgz