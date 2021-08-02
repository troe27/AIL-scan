#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge11
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge11_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge11_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2819_S79_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2952_S85_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2576_S39_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3206_S58_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3103_S72_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3055_S38_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2491_S28_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2854_S80_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2372_F15_S83_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2341_S4_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.11.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.11.vcf.bgz