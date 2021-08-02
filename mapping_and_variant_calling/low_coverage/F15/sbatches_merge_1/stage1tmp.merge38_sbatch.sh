#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge38
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge38_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge38_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3016_S8_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2540_S55_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2374_F15_S85_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2593_S89_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2881_S20_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2916_S38_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8261_S8_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2774_S56_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3071_S49_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8223_S4_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.38.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.38.vcf.bgz