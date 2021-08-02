#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge91
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge91_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge91_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3115_S82_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3165_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2427_F15_S63_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8351_S87_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8117_S98_L003.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3013_S5_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2947_S55_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2954_S59_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2432_F15_S68_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2369_F15_S80_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.91.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.91.vcf.bgz