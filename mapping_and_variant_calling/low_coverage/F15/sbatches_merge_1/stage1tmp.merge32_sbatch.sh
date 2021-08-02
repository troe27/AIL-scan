#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge32
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge32_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge32_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2565_S74_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2937_S51_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2963_S65_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3038_S26_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2900_S30_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3099_S70_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2334_S4_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3319_S53_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2404_S54_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2934_S48_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.32.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.32.vcf.bgz