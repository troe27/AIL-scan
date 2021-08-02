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
bcftools merge /home/tilman/storage/F13/data/1387_F13_S55_L005.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1323_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1363_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/1330_F13_S52_L005.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1279_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1337_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1289_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/1353_F13_S58_L005.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1372_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1350_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1274_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz && tabix -p vcf /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz