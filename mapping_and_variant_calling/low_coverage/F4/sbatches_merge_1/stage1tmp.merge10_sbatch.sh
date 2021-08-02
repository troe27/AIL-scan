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
bcftools merge /home/tilman/storage/F4/data/3605_F4_S25_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3427_F4_S77_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3736_F4_S48_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3405_F4_S72_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3370_F4_S64_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3583_F4_S20_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3527_F4_S9_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3341_F4_S60_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3422_F4_S76_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3560_F4_S16_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.10.vcf.bgz && tabix -p vcf /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.10.vcf.bgz