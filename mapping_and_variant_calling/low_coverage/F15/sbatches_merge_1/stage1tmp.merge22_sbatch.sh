#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge22
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge22_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge22_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2337_S5_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2908_S95_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2830_S86_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3198_S50_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2890_S27_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2434_F15_S70_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3320_S54_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3088_S64_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2487_S27_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2442_S85_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.22.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.22.vcf.bgz