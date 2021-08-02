#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge27
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge27_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge27_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3067_S59_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2852_S6_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2782_S59_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3034_S23_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2749_S59_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2923_S42_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3147_S12_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2737_S34_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2374_S31_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8319_S71_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.27.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.27.vcf.bgz