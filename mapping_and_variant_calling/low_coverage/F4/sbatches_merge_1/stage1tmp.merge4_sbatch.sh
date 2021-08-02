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
bcftools merge /home/tilman/storage/F4/data/3309_F4_S52_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3703_F4_S44_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3482_F4_S3_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3397_F4_S71_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3436_F4_S80_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3625_F4_S29_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3318_F4_S55_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3317_F4_S54_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3707_F4_S17_L006.cleaned.vcf.bgz /home/tilman/storage/F4/data/3592_F4_S23_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz