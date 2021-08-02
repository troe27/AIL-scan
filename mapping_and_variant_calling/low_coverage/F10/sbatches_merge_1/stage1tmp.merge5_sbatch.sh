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
bcftools merge /home/tilman/storage/F10/data/3844_F10_S51_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3745_F10_S8_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4343_F10_S79_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3816_F10_S40_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3753_F10_S10_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3792_F10_S26_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4363_F10_S85_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3760_F10_S13_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3803_F10_S33_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3825_F10_S43_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3778_F10_S22_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz && tabix -p vcf /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz