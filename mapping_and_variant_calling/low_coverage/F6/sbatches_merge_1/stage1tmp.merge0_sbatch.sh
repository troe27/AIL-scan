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
bcftools merge /home/tilman/storage/F6/data/8596_F6_S56_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8589_F6_S54_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8645_F6_S76_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8567_F6_S44_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8554_F6_S40_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8421_F6_S89_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8632_F6_S68_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8545_F6_S35_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8518_F6_S27_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8643_F6_S75_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8612_F6_S62_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz