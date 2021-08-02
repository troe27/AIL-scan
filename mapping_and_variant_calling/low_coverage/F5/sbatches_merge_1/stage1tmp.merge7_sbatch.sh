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
bcftools merge /home/tilman/storage/F5/data/6367_F5_S22_L006.cleaned.vcf.bgz /home/tilman/storage/F5/data/6226_F5_S69_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6257_F5_S9_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6338_F5_S78_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6203_F5_S91_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6196_F5_S86_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6097_F5_S60_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6335_F5_S39_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6361_F5_S48_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6192_F5_S84_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz