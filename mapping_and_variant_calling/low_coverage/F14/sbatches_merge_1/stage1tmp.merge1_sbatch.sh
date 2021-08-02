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
bcftools merge /home/tilman/storage/F14/data/F14_1463_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1595_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1564_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1570_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1526_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/1519_F14_S95_L004.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1565_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1698_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1540_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1530_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1522_Sx_merged.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F14/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage/F14/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz