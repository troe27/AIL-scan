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
bcftools merge /home/tilman/storage/F4/data/3435_F4_S79_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3354_F4_S62_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3329_F4_S57_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3518_F4_S7_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3462_F4_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F4/data/3271_F4_S45_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3446_F4_S83_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3352_F4_S61_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3613_F4_S27_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3687_F4_S42_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz