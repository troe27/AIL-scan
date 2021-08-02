#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_2
#SBATCH -o ./sbatches_merge_2_%j.out
#SBATCH -e ./sbatches_merge_2_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
bcftools merge /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.31.vcf.bgz /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.28.vcf.bgz /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.44.vcf.bgz /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.45.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage2/run002.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage2/run002.tmp.merge.6.vcf.bgz