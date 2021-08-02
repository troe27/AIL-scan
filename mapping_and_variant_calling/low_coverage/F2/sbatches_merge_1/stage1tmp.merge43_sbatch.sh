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
bcftools merge /home/tilman/storage2/F2/data/F2_1190_S20_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_834_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1106_S42_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_725_S88_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_640_S9_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1278_S94_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_567_S37_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1399_F2_S48_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_825_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_665_S33_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.43.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.43.vcf.bgz