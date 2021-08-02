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
bcftools merge /home/tilman/storage2/F2/data/F2_541_S14_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1300_S81_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_161_S1_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_372_S7_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_823_S74_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_993_S32_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_564_S34_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_556_S26_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1125_S61_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_505_S69_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.18.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.18.vcf.bgz