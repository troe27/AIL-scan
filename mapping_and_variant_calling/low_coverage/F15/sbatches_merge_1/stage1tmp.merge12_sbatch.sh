#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge12
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge12_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge12_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3089_S65_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2483_S15_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2839_S92_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3318_S52_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2981_S79_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3167_S27_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2978_S91_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8153_S84_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2805_S73_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2785_S34_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.12.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.12.vcf.bgz