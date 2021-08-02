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
bcftools merge /home/tilman/storage/F6/data/8441_F6_S95_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8603_F6_S59_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8559_F6_S42_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8402_F6_S83_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8487_F6_S17_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8449_F6_S3_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8628_F6_S66_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8595_F6_S55_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8633_F6_S69_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8642_F6_S74_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8425_F6_S90_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz