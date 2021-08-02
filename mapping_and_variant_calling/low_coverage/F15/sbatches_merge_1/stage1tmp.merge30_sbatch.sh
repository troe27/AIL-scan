#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge30
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge30_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge30_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2716_S55_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8269_S9_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3303_S39_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2428_F15_S64_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3142_S7_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8307_S95_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3225_S76_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2975_S74_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3282_S22_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3310_S45_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.30.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.30.vcf.bgz