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
bcftools merge /home/tilman/storage/F16/data/F16_7350_S8_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7271_S72_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7392_S19_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7273_S73_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7328_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7396_S21_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7373_S14_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7220_S54_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7393_S20_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7321_S92_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7361_S11_L003.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz