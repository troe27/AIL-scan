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
bcftools merge /home/tilman/storage/F4/data/3279_F4_S47_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3467_F4_S89_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3612_F4_S26_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3593_F4_S24_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3552_F4_S14_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3663_F4_S36_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3732_F4_S47_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3788_F4_S57_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3579_F4_S19_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3718_F4_S45_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.9.vcf.bgz && tabix -p vcf /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.9.vcf.bgz