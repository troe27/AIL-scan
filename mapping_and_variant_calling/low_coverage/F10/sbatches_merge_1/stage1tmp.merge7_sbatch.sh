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
bcftools merge /home/tilman/storage/F10/data/3821_F10_S41_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3871_F10_S67_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3782_F10_S23_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3772_F10_S19_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4314_F10_S77_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3865_F10_S63_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3843_F10_S49_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3785_F10_S24_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3857_F10_S58_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4272_F10_S69_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3846_F10_S53_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz