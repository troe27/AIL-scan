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
bcftools merge /home/tilman/storage/F10/data/4347_F10_S82_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4310_F10_S75_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3762_F10_S14_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3845_F10_S52_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3815_F10_S39_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3868_F10_S64_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3869_F10_S65_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3848_F10_S55_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3847_F10_S54_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3813_F10_S37_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3771_F10_S18_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz