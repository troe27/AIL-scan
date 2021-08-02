#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge24
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge24_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge24_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3309_F3_S49_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3413_F3_S52_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3336_F3_S75_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3372_F3_S12_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3151_F3_S92_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3308_F3_S48_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3257_F3_S95_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3546_F3_S76_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3438_F3_S77_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3500_F3_S33_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.24.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.24.vcf.bgz