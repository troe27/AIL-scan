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
bcftools merge /home/tilman/storage/F11/data/F11_6301_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6280_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6320_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6371_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6276_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6289_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6408_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6234_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6235_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6403_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6295_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz