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
bcftools merge /home/tilman/storage/F10/data/3739_F10_S5_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3744_F10_S7_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3826_F10_S44_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3864_F10_S62_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4384_F10_S50_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4344_F10_S80_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3798_F10_S31_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4265_F10_S68_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3797_F10_S30_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3769_F10_S16_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3862_F10_S60_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz