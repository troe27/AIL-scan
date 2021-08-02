#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge56
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge56_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge56_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3159_S19_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2380_S37_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3284_S24_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2588_S85_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2348_S6_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3018_S10_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8355_S66_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2616_S9_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2797_S65_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2470_S8_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.56.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.56.vcf.bgz