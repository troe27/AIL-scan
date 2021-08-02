#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge55
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge55_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge55_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3192_S45_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2722_S22_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3214_S66_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3211_S63_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3193_S46_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2582_S42_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3031_S22_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2530_S48_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2903_S31_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3201_S53_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.55.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.55.vcf.bgz