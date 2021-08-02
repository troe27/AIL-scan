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
bcftools merge /home/tilman/storage/F4/data/3476_F4_S1_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3437_F4_S81_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3408_F4_S73_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3664_F4_S37_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3262_F4_S42_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3677_F4_S39_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3678_F4_S40_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3516_F4_S6_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3647_F4_S33_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3495_F4_S4_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz