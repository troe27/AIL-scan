#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge67
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge67_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge67_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2615_S53_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2397_S48_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3347_S108_L003.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3183_S39_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2920_S41_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3345_S83_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8413_S96_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2484_S26_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2375_S32_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2443_S86_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.67.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.67.vcf.bgz