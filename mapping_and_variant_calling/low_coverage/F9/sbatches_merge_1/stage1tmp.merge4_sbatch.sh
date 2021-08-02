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
bcftools merge /home/tilman/storage/F9/data/F9_2176_S12_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2189_S18_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2153_S3_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2204_S23_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2276_S55_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2206_S25_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2205_S24_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2278_S56_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2234_S39_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2190_S19_L004.cleaned.vcf.bgz /home/tilman/storage/F9/data/F9_2318_S75_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F9/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage/F9/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz