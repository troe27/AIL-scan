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
bcftools merge /home/tilman/storage/F11/data/F11_6304_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6269_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6391_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6345_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6414_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6330_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6283_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6404_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6253_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6265_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F11/data/F11_6347_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage/F11/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz