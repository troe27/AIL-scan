#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge52
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge52_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge52_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3191_S44_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3037_S45_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2437_S82_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_9617_S75_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3143_S8_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2358_S8_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3202_S54_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2811_F15_S74_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2506_S27_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3223_S74_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.52.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.52.vcf.bgz