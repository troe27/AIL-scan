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
bcftools merge /home/tilman/storage/F4/data/3565_F4_S17_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3340_F4_S59_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3289_F4_S48_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3680_F4_S41_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3413_F4_S75_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3306_F4_S51_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3757_F4_S52_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3444_F4_S82_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3586_F4_S22_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3671_F4_S38_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3741_F4_S49_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz