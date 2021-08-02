#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge17
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge17_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge17_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2542_S57_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2733_S30_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2884_S22_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2968_S69_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8193_S80_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2861_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2490_S20_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3148_S13_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2501_S30_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2835_S88_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.17.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.17.vcf.bgz