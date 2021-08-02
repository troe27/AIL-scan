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
bcftools merge /home/tilman/storage/F4/data/3720_F4_S18_L006.cleaned.vcf.bgz /home/tilman/storage/F4/data/3454_F4_S15_L006.cleaned.vcf.bgz /home/tilman/storage/F4/data/3472_F4_S90_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3412_F4_S74_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3767_F4_S53_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3545_F4_S11_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3585_F4_S21_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3328_F4_S56_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3526_F4_S8_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3558_F4_S15_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3659_F4_S35_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz