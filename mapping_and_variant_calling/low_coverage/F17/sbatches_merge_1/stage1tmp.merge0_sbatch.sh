#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 8
#SBATCH -J ./sbatches_merge_1
#SBATCH -o ./sbatches_merge_1_%j.out
#SBATCH -e ./sbatches_merge_1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
bcftools merge /home/tilman/storage/F17/data/F17_1159_S36_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1238_S46_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1373_S73_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1184_S40_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1258_S51_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1212_S43_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1372_S72_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1320_S61_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1146_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1234_S45_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1365_S70_L003.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F17/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F17/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz