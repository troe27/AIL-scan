#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge65
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge65_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge65_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_8247_S88_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2939_S52_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3194_S47_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3005_S95_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2493_S21_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8113_S105_L003.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3279_S19_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2813_F15_S75_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3046_S32_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3307_S42_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.65.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.65.vcf.bgz