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
bcftools merge /home/tilman/storage/F7/data/9013_F7_S86_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9125_F7_S95_L002.cleaned.vcf.bgz /home/tilman/storage/F7/data/9078_F7_S4_L006.cleaned.vcf.bgz /home/tilman/storage/F7/data/9016_F7_S87_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9103_F7_S91_L002.cleaned.vcf.bgz /home/tilman/storage/F7/data/9056_F7_S1_L006.cleaned.vcf.bgz /home/tilman/storage/F7/data/9096_F7_S8_L006.cleaned.vcf.bgz /home/tilman/storage/F7/data/9139_F7_S91_L003.cleaned.vcf.bgz /home/tilman/storage/F7/data/9162_F7_S96_L003.cleaned.vcf.bgz /home/tilman/storage/F7/data/9153_F7_S94_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F7/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage/F7/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz