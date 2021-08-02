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
bcftools merge /home/tilman/storage2/F2/data/F2_153_S6_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_781_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_701_S67_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_857_S9_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1056_S92_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1104_S40_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1203_S33_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1332_F2_S5_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_995_S34_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1468_F2_S88_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.9.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.9.vcf.bgz