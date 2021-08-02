#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge22
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge22_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge22_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3318_F3_S58_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3489_F3_S24_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3569_F3_S95_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3297_F3_S37_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3345_F3_S82_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3463_F3_S1_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3488_F3_S23_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3449_F3_S86_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3380_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3423_F3_S62_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.22.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.22.vcf.bgz