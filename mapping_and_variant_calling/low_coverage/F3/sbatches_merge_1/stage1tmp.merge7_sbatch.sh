#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge7
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge7_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge7_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3579_F3_S10_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3526_F3_S56_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3432_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3354_F3_S91_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3468_F3_S26_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3197_F3_S40_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3401_F3_S40_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3412_F3_S51_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3427_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3468_F3_S6_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz