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
bcftools merge /home/tilman/storage/F18/data/F18_2944_S45_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1980_S25_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_3016_S61_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1964_S18_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1993_S30_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2028_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1907_S90_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1992_S29_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_3014_S60_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1952_S11_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2998_S55_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz