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
bcftools merge /home/tilman/storage2/F2/data/F2_1307_S87_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_933_S72_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/394_F2_S23_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1165_S93_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_642_S11_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1228_S55_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_660_S28_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_247_S37_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1336_F2_S7_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1422_F2_S66_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.49.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.49.vcf.bgz