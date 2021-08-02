#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge48
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge48_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge48_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2496_S24_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2609_S8_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2766_S52_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2549_S62_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2369_S27_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2594_S90_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2793_S63_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2365_S24_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2795_S64_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8377_S16_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.48.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.48.vcf.bgz