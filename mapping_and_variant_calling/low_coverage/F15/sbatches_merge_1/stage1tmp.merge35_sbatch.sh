#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge35
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge35_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge35_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2863_S10_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3136_S2_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3170_S29_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2953_S58_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2904_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8245_S79_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3326_S60_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2524_S25_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2353_S16_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2448_S16_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.35.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.35.vcf.bgz