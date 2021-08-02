#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge37
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge37_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge37_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3404_F3_S43_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3170_F3_S14_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3228_F3_S71_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3612_F3_S41_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3157_F3_S2_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3464_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3298_F3_S38_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3470_F3_S8_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3551_F3_S80_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3454_F3_S90_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.37.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.37.vcf.bgz