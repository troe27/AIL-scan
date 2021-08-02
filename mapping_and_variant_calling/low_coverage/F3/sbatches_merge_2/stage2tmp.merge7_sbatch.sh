#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_2/stage2tmp.merge7
#SBATCH -o ./sbatches_merge_2/stage2tmp.merge7_%j.out
#SBATCH -e ./sbatches_merge_2/stage2tmp.merge7_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.25.vcf.bgz /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.46.vcf.bgz /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.36.vcf.bgz /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.19.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage2/run002.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage2/run002.tmp.merge.7.vcf.bgz