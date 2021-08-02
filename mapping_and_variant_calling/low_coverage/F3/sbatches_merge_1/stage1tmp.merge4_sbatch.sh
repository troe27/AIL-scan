#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge4
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge4_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge4_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3564_F3_S90_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3326_F3_S65_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3310_F3_S50_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3441_F3_S80_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3559_F3_S86_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3250_F3_S90_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3486_F3_S21_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3553_F3_S81_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3302_F3_S42_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3480_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3492_F3_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz