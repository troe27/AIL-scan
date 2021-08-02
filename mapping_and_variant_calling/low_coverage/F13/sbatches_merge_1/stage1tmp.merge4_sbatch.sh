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
bcftools merge /home/tilman/storage/F13/data/F13_1295_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1342_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1346_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1339_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1280_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1367_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1390_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1316_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1386_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1389_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1335_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz
