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
bcftools merge /home/tilman/storage/F9/data/F9_2197_S20_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2156_S4_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2241_S44_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2255_S45_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2233_S38_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2177_S13_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2166_S9_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2214_S28_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2286_S61_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2298_S66_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2168_S11_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F9/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage/F9/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz