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
bcftools merge /home/tilman/storage/F13/data/F13_1325_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1298_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1307_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1341_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1357_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1371_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1380_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1293_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1332_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1310_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1355_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1294_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz
