#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 8
#SBATCH -J ./sbatches_merge_1
#SBATCH -o ./sbatches_merge_1_%j.out
#SBATCH -e ./sbatches_merge_1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
bcftools merge /home/tilman/storage/F16/data/F16_7279_S76_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7399_S22_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7239_S61_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7196_S45_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7254_S65_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7290_S80_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7418_S28_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7355_S10_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7339_S6_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7221_S55_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7264_S29_L003.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz