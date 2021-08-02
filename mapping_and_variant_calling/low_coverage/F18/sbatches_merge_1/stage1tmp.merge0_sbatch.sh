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
bcftools merge /home/tilman/storage/F18/data/F18_1889_S80_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1900_S85_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1920_S94_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1927_S2_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1892_S82_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2937_S43_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1949_S10_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_3053_S116_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2006_S33_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2009_S35_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1956_S14_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz