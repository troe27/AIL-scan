#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge5
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge5_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge5_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_8365_S15_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3179_S35_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2924_S43_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3091_S62_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3285_S25_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2424_S70_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3203_S55_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3217_S69_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2781_S58_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3065_S46_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8151_S103_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz