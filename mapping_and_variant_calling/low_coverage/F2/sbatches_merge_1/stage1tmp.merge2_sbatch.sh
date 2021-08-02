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
bcftools merge /home/tilman/storage2/F2/data/F2_170_S6_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1308_S88_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_288_S54_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_687_S53_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1340_F2_S9_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1264_S82_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1031_S67_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1138_S69_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1115_S51_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_836_S86_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1063_S3_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz