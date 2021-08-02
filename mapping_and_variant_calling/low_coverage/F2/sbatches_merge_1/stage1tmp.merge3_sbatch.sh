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
bcftools merge /home/tilman/storage2/F2/data/411_F2_S38_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1210_S39_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1265_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1249_S71_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_543_S16_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_240_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1178_S9_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1317_S96_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_374_S9_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_785_S40_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_782_S37_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz