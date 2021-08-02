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
bcftools merge /home/tilman/storage/F17/data/F17_1200_S41_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1389_S75_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1227_S44_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1249_S50_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1338_S65_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1349_S67_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1288_S58_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1154_S35_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1202_S42_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1286_S56_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1243_S47_L003.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F17/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage/F17/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz