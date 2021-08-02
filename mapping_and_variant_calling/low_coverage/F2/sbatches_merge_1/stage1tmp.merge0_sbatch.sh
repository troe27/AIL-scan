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
bcftools merge /home/tilman/storage2/F2/data/F2_1079_S18_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_597_S64_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_750_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1246_S68_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_492_S59_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1437_F2_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_469_S46_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_198_S17_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1009_S48_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_523_S86_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/403_F2_S30_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz