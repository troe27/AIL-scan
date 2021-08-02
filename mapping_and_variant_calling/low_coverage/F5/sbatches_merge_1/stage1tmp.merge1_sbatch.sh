#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1
#SBATCH -o ./sbatches_merge_1_%j.out
#SBATCH -e ./sbatches_merge_1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
bcftools merge /home/tilman/storage/F5/data/6304_F5_S28_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6343_F5_S41_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6385_F5_S81_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6206_F5_S92_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6218_F5_S95_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6089_F5_S60_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6324_F5_S35_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6160_F5_S64_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6214_F5_S21_L006.cleaned.vcf.bgz /home/tilman/storage/F5/data/6245_F5_S7_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6208_F5_S93_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz