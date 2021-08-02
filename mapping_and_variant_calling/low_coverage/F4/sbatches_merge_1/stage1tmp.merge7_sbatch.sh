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
bcftools merge /home/tilman/storage/F4/data/3688_F4_S43_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3743_F4_S50_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3457_F4_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F4/data/3618_F4_S28_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3337_F4_S14_L006.cleaned.vcf.bgz /home/tilman/storage/F4/data/3550_F4_S13_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3392_F4_S68_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3576_F4_S18_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3642_F4_S31_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3383_F4_S67_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz