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
bcftools merge /home/tilman/storage/F9/data/F9_2275_S54_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2328_S79_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2213_S27_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2279_S57_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2225_S34_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2158_S6_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2303_S70_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2222_S31_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2224_S33_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2280_S58_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2160_S7_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2151_S1_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F9/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F9/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz