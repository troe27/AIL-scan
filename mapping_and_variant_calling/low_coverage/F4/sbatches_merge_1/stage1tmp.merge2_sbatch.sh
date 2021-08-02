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
bcftools merge /home/tilman/storage/F4/data/3270_F4_S44_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3396_F4_S70_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3546_F4_S12_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3434_F4_S78_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3451_F4_S86_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3638_F4_S30_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3310_F4_S13_L006.cleaned.vcf.bgz /home/tilman/storage/F4/data/3725_F4_S46_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3756_F4_S51_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3657_F4_S34_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz