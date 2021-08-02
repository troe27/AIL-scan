#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge29
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge29_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge29_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3262_F3_S4_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3291_F3_S31_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3152_F3_S93_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3594_F3_S25_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3433_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3537_F3_S67_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3592_F3_S23_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3467_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3340_F3_S78_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3231_F3_S73_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.29.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.29.vcf.bgz