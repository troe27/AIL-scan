#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J stage2tmp.merge3
#SBATCH -o stage2tmp.merge3_%j.out
#SBATCH -e stage2tmp.merge3_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
module load bioinfo-tools
module load bcftools
module load htslib
source activate venv3

bcftools merge /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.27.vcf.bgz /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.24.vcf.bgz /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.34.vcf.bgz /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.38.vcf.bgz /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.11.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage2/run002.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage2/run002.tmp.merge.3.vcf.bgz
