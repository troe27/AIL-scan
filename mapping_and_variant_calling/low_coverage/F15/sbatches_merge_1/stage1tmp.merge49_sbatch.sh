#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge49
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge49_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge49_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2350_S13_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2979_S77_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3166_S26_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3080_S58_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3126_S90_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8155_S81_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2494_S22_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3113_S80_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3329_S62_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2919_S40_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.49.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.49.vcf.bgz