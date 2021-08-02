#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge71
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge71_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge71_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2352_S15_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3311_S46_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2999_S46_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2719_S19_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2610_S50_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3255_S3_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2985_S83_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2734_S31_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2859_S83_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2764_S51_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.71.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.71.vcf.bgz