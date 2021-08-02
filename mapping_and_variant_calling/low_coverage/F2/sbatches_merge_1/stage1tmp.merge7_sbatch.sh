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
bcftools merge /home/tilman/storage2/F2/data/F2_859_S11_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1282_S65_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1053_S89_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/387_F2_S16_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1288_S70_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_558_S28_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1164_S92_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1247_S69_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1060_S96_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_998_S37_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz