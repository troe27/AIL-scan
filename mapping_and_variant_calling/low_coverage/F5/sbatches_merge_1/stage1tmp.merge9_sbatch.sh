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
bcftools merge /home/tilman/storage/F5/data/6379_F5_S53_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6096_F5_S19_L006.cleaned.vcf.bgz /home/tilman/storage/F5/data/6150_F5_S72_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6287_F5_S22_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6233_F5_S71_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6198_F5_S87_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6117_F5_S65_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6110_F5_S63_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6142_F5_S70_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6383_F5_S54_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.9.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.9.vcf.bgz