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
bcftools merge /home/tilman/storage/F13/data/1273_F13_S57_L005.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1324_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1381_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1308_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1314_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1315_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1267_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1270_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1352_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1360_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1331_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz
