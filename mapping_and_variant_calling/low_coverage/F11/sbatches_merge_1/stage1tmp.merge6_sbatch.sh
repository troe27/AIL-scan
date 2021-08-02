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
bcftools merge /home/tilman/storage/F11/data/F11_6278_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6305_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6405_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6341_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6370_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6287_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6271_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6396_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6299_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6365_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6259_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz