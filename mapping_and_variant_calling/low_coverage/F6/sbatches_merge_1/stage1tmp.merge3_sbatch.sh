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
bcftools merge /home/tilman/storage/F6/data/8553_F6_S39_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8652_F6_S78_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8504_F6_S22_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8446_F6_S1_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8514_F6_S26_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8651_F6_S77_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8661_F6_S80_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8619_F6_S64_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8584_F6_S52_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8411_F6_S86_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8405_F6_S84_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz