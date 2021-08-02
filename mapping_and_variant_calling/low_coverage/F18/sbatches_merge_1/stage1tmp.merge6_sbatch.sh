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
bcftools merge /home/tilman/storage/F18/data/F18_1923_S96_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1893_S83_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_3061_S77_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2007_S34_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2000_S32_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1928_S3_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1904_S87_L003.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1946_S8_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2975_S50_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_2989_S53_L005.cleaned.vcf.bgz /home/tilman/storage/F18/data/F18_1918_S93_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage/F18/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz