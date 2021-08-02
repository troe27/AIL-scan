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
bcftools merge /home/tilman/storage/F16/data/F16_7199_S47_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7367_S12_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7195_S44_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7409_S25_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7210_S49_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7265_S69_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7274_S74_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7236_S59_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7256_S67_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7410_S26_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7198_S46_L008.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz