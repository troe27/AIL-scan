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
bcftools merge /home/tilman/storage/F11/data/F11_6336_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6373_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6274_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6309_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6241_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6398_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6327_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6379_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6308_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6262_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6399_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz && tabix -p vcf /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz