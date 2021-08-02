#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge68
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge68_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge68_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2357_S19_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3262_S7_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2714_S15_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2880_S88_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2392_S46_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8179_S90_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2960_S63_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3139_S4_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2418_S66_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2888_S25_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.68.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.68.vcf.bgz