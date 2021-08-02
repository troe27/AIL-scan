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
bcftools merge /home/tilman/storage/F9/data/F9_2178_S14_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2269_S52_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2228_S37_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2315_S74_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2285_S60_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2157_S5_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2152_S2_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2240_S43_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2167_S10_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2183_S15_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2295_S64_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2215_S29_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F9/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F9/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz