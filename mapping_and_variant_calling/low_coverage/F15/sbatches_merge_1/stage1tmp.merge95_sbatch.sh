#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge95
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge95_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge95_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3302_S38_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8275_S91_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2536_S52_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3131_S94_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8299_S80_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3236_S85_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3081_S60_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3342_S72_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2488_S18_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2600_S48_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.95.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.95.vcf.bgz