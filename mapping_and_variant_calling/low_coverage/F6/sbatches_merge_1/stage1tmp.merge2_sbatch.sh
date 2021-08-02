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
bcftools merge /home/tilman/storage/F6/data/8448_F6_S2_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8474_F6_S12_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8521_F6_S28_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8531_F6_S31_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8532_F6_S32_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8653_F6_S79_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8437_F6_S93_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8537_F6_S33_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8409_F6_S85_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8544_F6_S34_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8610_F6_S61_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz