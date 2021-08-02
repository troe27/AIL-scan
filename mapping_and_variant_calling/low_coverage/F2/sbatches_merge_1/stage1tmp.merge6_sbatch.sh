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
bcftools merge /home/tilman/storage2/F2/data/F2_583_S50_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_659_S27_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_634_S3_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_446_S32_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_644_S13_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_428_S22_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1037_S73_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_870_S21_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_808_S63_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1322_S113_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz