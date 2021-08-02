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
bcftools merge /home/tilman/storage/F14/data/F14_1548_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1569_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1563_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1567_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1538_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1568_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/1520_F14_S96_L004.cleaned.vcf.bgz /home/tilman/storage/F14/data/1518_F14_S94_L004.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1580_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/1510_F14_S93_L004.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F14/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F14/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz