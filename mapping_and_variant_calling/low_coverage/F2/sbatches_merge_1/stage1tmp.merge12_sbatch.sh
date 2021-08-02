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
bcftools merge /home/tilman/storage2/F2/data/F2_1269_S86_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1101_S37_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_968_S8_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_674_S40_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1028_S64_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1367_F2_S27_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_962_S2_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_946_S84_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_888_S37_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1296_S78_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.12.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.12.vcf.bgz