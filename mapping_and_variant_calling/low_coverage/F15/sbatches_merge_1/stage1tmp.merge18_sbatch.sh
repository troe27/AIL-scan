#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge18
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge18_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge18_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3181_S37_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2870_S16_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2815_F15_S77_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2573_S79_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8591_S1_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3317_S51_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3059_S41_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2362_S22_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2932_S79_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2973_S73_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.18.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.18.vcf.bgz