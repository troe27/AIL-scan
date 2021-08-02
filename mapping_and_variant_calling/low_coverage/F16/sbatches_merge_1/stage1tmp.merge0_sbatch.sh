#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 8
#SBATCH -J ./sbatches_merge_1
#SBATCH -o ./sbatches_merge_1_%j.out
#SBATCH -e ./sbatches_merge_1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
bcftools merge /home/tilman/storage/F16/data/F16_7188_S40_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7269_S71_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7333_S2_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7320_S91_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7212_S50_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7288_S79_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7192_S41_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7217_S52_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7354_S9_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7302_S85_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7329_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7301_S84_L008.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz