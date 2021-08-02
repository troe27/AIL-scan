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
bcftools merge /home/tilman/storage/F6/data/8617_F6_S63_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8578_F6_S48_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8525_F6_S29_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8637_F6_S71_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8600_F6_S58_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8580_F6_S49_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8401_F6_S82_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8484_F6_S16_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8629_F6_S67_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8473_F6_S11_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz