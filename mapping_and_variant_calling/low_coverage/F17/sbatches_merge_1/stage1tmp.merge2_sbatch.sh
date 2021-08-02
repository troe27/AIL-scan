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
bcftools merge /home/tilman/storage/F17/data/F17_1395_S76_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1147_S34_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1304_S60_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1361_S69_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1339_S66_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1366_S71_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1270_S54_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1331_S64_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1321_S62_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1245_S48_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1379_S74_L003.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F17/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F17/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz