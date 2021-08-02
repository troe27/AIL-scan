#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge62
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge62_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge62_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3264_S9_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3210_S62_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3095_S67_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2427_S73_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3260_S6_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2746_S41_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3066_S47_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2546_S35_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2812_S33_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2956_S60_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.62.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.62.vcf.bgz