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
bcftools merge /home/tilman/storage/F5/data/6263_F5_S12_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6123_F5_S62_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6265_F5_S13_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6381_F5_S80_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6360_F5_S47_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6201_F5_S89_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6230_F5_S3_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6294_F5_S74_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6312_F5_S32_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6390_F5_S55_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz