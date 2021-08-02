#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J new_stage2tmp.merge12
#SBATCH -o new_stage2tmp.merge12_%j.out
#SBATCH -e new_stage2tmp.merge12_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
module load bioinfo-tools
module load bcftools
module load htslib
bcftools merge /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.93.vcf.bgz /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.39.vcf.bgz /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.72.vcf.bgz /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.57.vcf.bgz /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.88.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage2/run002.tmp.merge.12.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage2/run002.tmp.merge.12.vcf.bgz
