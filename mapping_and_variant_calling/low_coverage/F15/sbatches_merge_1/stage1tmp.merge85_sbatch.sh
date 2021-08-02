#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge85
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge85_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge85_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2995_S91_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3195_S72_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2409_S58_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2361_S60_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2611_S51_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3107_S75_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2478_S45_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3084_S61_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2413_S61_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2889_S26_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.85.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.85.vcf.bgz