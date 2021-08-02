#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge79
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge79_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge79_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2898_S93_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2790_S61_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3266_S10_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2366_F15_S78_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3092_S66_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2799_S67_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3301_S94_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2385_S11_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2585_S44_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3173_S31_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.79.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.79.vcf.bgz