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
bcftools merge /home/tilman/storage2/F2/data/F2_926_S66_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_974_S13_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1102_S38_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1304_S84_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_700_S66_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_601_S68_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_937_S76_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1183_S14_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1315_S94_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_552_S23_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.53.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.53.vcf.bgz