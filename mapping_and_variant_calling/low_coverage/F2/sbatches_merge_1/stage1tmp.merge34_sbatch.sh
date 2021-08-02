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
bcftools merge /home/tilman/storage2/F2/data/F2_973_S12_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_509_S73_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1085_S24_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1298_S80_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1378_F2_S33_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1066_S6_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/409_F2_S36_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_828_S78_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_996_S35_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_532_S7_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.34.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.34.vcf.bgz