#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge20
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge20_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge20_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2780_S57_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3272_S15_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3314_S86_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3291_S30_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2495_S23_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2849_S4_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2753_S60_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2895_S92_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8285_S68_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3014_S6_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.20.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.20.vcf.bgz