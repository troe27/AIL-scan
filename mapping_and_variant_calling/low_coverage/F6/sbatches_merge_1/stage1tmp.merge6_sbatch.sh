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
bcftools merge /home/tilman/storage/F6/data/8494_F6_S19_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8438_F6_S94_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8450_F6_S4_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8470_F6_S10_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8475_F6_S13_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8444_F6_S96_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8549_F6_S37_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8460_F6_S6_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8599_F6_S57_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8505_F6_S23_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz