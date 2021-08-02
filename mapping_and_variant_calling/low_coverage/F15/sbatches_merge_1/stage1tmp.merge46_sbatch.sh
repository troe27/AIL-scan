#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge46
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge46_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge46_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3263_S8_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3135_S1_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3258_S5_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3341_S71_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2499_S25_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3190_S43_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3283_S23_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2405_S55_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3012_S48_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2461_S2_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.46.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.46.vcf.bgz