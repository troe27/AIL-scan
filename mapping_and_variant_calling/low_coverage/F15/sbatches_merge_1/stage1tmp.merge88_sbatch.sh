#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge88
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge88_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge88_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_1463_S87_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2951_S57_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3116_S63_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8162_S100_L003.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2829_S85_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2726_S25_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2866_S50_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2447_S90_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8177_S106_L003.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2927_S46_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.88.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.88.vcf.bgz