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
bcftools merge /home/tilman/storage2/F2/data/F2_958_S94_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_174_S8_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1162_S90_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1103_S39_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_901_S48_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1173_S5_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1292_S74_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_269_S45_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1074_S14_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_590_S57_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.30.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.30.vcf.bgz