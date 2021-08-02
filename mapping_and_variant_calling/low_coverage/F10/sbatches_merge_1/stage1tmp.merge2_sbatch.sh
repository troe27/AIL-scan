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
bcftools merge /home/tilman/storage/F10/data/3829_F10_S46_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3804_F10_S34_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3737_F10_S4_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3767_F10_S15_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3770_F10_S17_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3858_F10_S59_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3870_F10_S66_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3777_F10_S21_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4383_F10_S88_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4348_F10_S83_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4297_F10_S71_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz