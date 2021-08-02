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
bcftools merge /home/tilman/storage/F9/data/F9_2184_S16_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2216_S30_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2239_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2200_S22_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2165_S8_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2198_S21_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2188_S17_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2226_S35_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2264_S49_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2227_S36_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2223_S32_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2207_S26_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F9/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage/F9/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz