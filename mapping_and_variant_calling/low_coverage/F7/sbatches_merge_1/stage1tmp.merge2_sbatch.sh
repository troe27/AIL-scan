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
bcftools merge /home/tilman/storage/F7/data/9138_F7_S96_L003.cleaned.vcf.bgz /home/tilman/storage/F7/data/9160_F7_S95_L003.cleaned.vcf.bgz /home/tilman/storage/F7/data/9052_F7_S95_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9090_F7_S7_L006.cleaned.vcf.bgz /home/tilman/storage/F7/data/9012_F7_S85_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9023_F7_S89_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9008_F7_S83_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9086_F7_S6_L006.cleaned.vcf.bgz /home/tilman/storage/F7/data/9018_F7_S88_L004.cleaned.vcf.bgz /home/tilman/storage/F7/data/9097_F7_S24_L006.cleaned.vcf.bgz /home/tilman/storage/F7/data/9124_F7_S94_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F7/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F7/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz