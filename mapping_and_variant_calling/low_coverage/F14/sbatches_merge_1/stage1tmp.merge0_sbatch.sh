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
bcftools merge /home/tilman/storage/F14/data/F14_1604_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/1502_F14_S90_L004.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1594_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/1503_F14_S91_L004.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1578_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1579_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1546_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/1504_F14_S92_L004.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1523_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1588_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F14/data/F14_1561_Sx_merged.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F14/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F14/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz