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
bcftools merge /home/tilman/storage/F5/data/6392_F5_S57_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6296_F5_S26_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6146_F5_S71_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6200_F5_S88_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6378_F5_S52_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6202_F5_S90_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6266_F5_S14_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6366_F5_S49_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6205_F5_S68_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6107_F5_S61_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.8.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.8.vcf.bgz