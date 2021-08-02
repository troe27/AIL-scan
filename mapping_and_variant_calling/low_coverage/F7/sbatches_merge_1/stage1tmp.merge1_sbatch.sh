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
bcftools merge /home/tilman/storage/F7/data/9042_F7_S93_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9141_F7_S92_L003.cleaned.vcf.bgz /home/tilman/storage/F7/data/9114_F7_S94_L002.cleaned.vcf.bgz /home/tilman/storage/F7/data/9109_F7_S93_L002.cleaned.vcf.bgz /home/tilman/storage/F7/data/9010_F7_S84_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9039_F7_S92_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9106_F7_S92_L002.cleaned.vcf.bgz /home/tilman/storage/F7/data/9083_F7_S5_L006.cleaned.vcf.bgz /home/tilman/storage/F7/data/9064_F7_S3_L006.cleaned.vcf.bgz /home/tilman/storage/F7/data/9100_F7_S90_L002.cleaned.vcf.bgz /home/tilman/storage/F7/data/9050_F7_S94_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F7/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage/F7/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz