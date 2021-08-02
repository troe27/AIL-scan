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
bcftools merge /home/tilman/storage/F11/data/F11_6338_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6332_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6344_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6223_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6377_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6268_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6290_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6334_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6401_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6313_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6244_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz