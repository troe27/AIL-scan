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
bcftools merge /home/tilman/storage/F18/data/F18_1921_S95_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1934_S6_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2992_S54_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_3013_S59_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1957_S15_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1886_S79_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1984_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1955_S13_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2012_S36_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2016_S39_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1971_S20_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz && tabix -p vcf /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz