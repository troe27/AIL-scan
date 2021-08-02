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
bcftools merge /home/tilman/storage2/F2/data/F2_964_S5_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_528_S3_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1095_S32_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_470_S47_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_695_S61_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_703_S69_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1130_S66_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_539_S13_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1469_F2_S89_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1189_S19_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.24.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.24.vcf.bgz