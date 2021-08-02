#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge83
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge83_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge83_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2977_S76_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3196_S48_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2767_S53_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2744_S58_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2475_S22_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3036_S25_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3085_S62_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3050_S34_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2936_S50_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2948_S39_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.83.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.83.vcf.bgz