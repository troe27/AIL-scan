#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge70
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge70_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge70_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2522_S43_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2451_S18_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2493_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3032_S50_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2522_S47_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8139_S85_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3288_S27_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2768_S54_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2383_S40_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8467_S65_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.70.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.70.vcf.bgz