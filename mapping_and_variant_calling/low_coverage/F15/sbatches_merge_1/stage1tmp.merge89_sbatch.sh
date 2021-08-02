#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge89
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge89_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge89_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2556_S68_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2970_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2847_S2_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8293_S85_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2823_S80_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2808_F15_S71_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2493_S46_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3112_S79_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2976_S75_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2918_S41_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.89.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.89.vcf.bgz