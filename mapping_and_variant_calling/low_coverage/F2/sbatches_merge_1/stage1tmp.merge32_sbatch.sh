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
bcftools merge /home/tilman/storage2/F2/data/F2_491_S58_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_430_S24_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_885_S34_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_603_S70_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1342_F2_S11_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_858_S10_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1352_F2_S18_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_510_S74_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_291_S56_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_728_S90_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.32.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.32.vcf.bgz