#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge12
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge12_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge12_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3518_F3_S36_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3432_F3_S71_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3568_F3_S94_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3439_F3_S78_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3457_F3_S93_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3304_F3_S44_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3414_F3_S53_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3353_F3_S8_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3206_F3_S49_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3517_F3_S48_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.12.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.12.vcf.bgz