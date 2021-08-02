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
bcftools merge /home/tilman/storage/F13/data/F13_1322_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1276_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1285_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1385_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1358_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1321_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1365_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1328_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1317_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1336_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1272_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz
