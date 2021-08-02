#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge74
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge74_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge74_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2743_S39_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2503_S31_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2809_F15_S72_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3160_S20_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2515_S38_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2748_F15_S89_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3295_S33_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3234_S83_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2535_S34_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2463_S21_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.74.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.74.vcf.bgz