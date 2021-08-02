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
bcftools merge /home/tilman/storage2/F2/data/F2_666_S34_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_832_S82_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1350_F2_S16_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_820_S73_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_743_S7_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_965_S4_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1262_S81_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1170_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_972_S11_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_713_S77_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz