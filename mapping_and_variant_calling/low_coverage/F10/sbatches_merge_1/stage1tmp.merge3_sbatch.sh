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
bcftools merge /home/tilman/storage/F10/data/4304_F10_S74_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3775_F10_S20_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4300_F10_S73_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4274_F10_S70_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4350_F10_S84_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4311_F10_S76_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3806_F10_S36_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3735_F10_S3_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3799_F10_S32_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3849_F10_S56_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3839_F10_S48_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz