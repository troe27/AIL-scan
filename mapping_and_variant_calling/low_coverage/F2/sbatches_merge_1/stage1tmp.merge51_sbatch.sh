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
bcftools merge /home/tilman/storage2/F2/data/F2_521_S84_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1174_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_657_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1325_F2_S1_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/390_F2_S19_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1128_S64_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1429_F2_S72_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1096_S33_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1223_S50_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_486_S55_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.51.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.51.vcf.bgz