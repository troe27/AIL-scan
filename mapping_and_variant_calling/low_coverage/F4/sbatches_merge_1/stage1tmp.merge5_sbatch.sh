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
bcftools merge /home/tilman/storage/F4/data/3475_F4_S16_L006.cleaned.vcf.bgz /home/tilman/storage/F4/data/3303_F4_S50_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3646_F4_S32_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3333_F4_S58_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3447_F4_S84_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3778_F4_S56_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3393_F4_S69_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3479_F4_S2_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3315_F4_S53_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3263_F4_S43_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz && tabix -p vcf /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz