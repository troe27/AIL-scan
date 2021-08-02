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
bcftools merge /home/tilman/storage/F7/data/9129_F7_S96_L003.cleaned.vcf.bgz /home/tilman/storage/F7/data/9119_F7_S96_L002.cleaned.vcf.bgz /home/tilman/storage/F7/data/9135_F7_S81_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9055_F7_S96_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9061_F7_S2_L006.cleaned.vcf.bgz /home/tilman/storage/F7/data/9142_F7_S93_L003.cleaned.vcf.bgz /home/tilman/storage/F7/data/9117_F7_S95_L002.cleaned.vcf.bgz /home/tilman/storage/F7/data/9032_F7_S91_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9128_F7_S96_L002.cleaned.vcf.bgz /home/tilman/storage/F7/data/9028_F7_S90_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9134_F7_S73_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F7/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F7/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz