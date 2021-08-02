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
bcftools merge /home/tilman/storage/F13/data/F13_1318_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1349_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/1343_F13_S56_L005.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1290_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1344_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1370_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/1374_F13_S54_L005.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1354_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1283_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1288_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1269_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz
