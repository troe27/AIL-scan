#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge57
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge57_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge57_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2740_S37_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3021_S13_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2564_S48_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3205_S57_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2840_S78_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3027_S49_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2498_S24_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2438_S83_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2545_S60_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2617_S10_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.57.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.57.vcf.bgz