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
bcftools merge /home/tilman/storage/F13/data/F13_1326_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1364_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1312_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1305_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1338_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1291_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1268_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1271_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1277_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1376_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1384_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz