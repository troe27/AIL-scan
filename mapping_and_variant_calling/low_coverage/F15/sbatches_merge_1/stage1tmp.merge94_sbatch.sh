#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge94
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge94_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge94_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2796_S69_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2583_S84_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2971_S72_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2866_S13_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2531_S49_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2966_S67_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3152_S16_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2534_S51_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2485_S16_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2342_S8_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.94.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.94.vcf.bgz