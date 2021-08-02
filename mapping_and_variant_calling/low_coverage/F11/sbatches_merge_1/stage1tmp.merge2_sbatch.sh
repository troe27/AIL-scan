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
bcftools merge /home/tilman/storage/F11/data/F11_6351_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6221_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6392_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6317_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6267_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6240_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6252_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6307_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6257_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6362_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6352_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz