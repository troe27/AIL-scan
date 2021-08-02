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
bcftools merge /home/tilman/storage2/F2/data/F2_497_S62_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_798_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1314_S93_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_801_S56_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_740_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_851_S3_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/391_F2_S20_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1039_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/392_F2_S21_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_416_S13_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.10.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.10.vcf.bgz