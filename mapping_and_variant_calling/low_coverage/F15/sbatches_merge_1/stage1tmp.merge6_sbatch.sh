#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge6
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge6_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge6_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2729_S28_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2801_S69_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2492_S20_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3060_S42_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2787_S60_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3044_S30_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3097_S69_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2759_S48_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8329_S86_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2893_S91_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3073_S51_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz