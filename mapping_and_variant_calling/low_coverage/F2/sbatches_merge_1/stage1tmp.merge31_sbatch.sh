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
bcftools merge /home/tilman/storage2/F2/data/F2_451_S36_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_421_S17_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_361_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_429_S23_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_861_S12_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1123_S59_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1280_S95_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_934_S73_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1316_S95_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1443_F2_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.31.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.31.vcf.bgz