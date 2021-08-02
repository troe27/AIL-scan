#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_2/stage2tmp.merge17
#SBATCH -o ./sbatches_merge_2/stage2tmp.merge17_%j.out
#SBATCH -e ./sbatches_merge_2/stage2tmp.merge17_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.75.vcf.bgz /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.23.vcf.bgz /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.94.vcf.bgz /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.50.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage2/run002.tmp.merge.17.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage2/run002.tmp.merge.17.vcf.bgz