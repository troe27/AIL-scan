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
bcftools merge /home/tilman/storage2/F2/data/F2_935_S74_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_506_S70_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1309_S89_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1454_F2_S84_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_959_S95_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_686_S52_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1075_S15_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_990_S29_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_498_S63_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1166_S94_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.22.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.22.vcf.bgz