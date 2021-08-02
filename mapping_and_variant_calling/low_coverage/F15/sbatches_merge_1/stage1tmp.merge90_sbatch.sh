#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge90
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge90_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge90_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3045_S31_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2429_S75_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3250_S95_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2902_S94_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2428_S74_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3145_S10_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2769_S55_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2970_S53_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2824_S81_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2815_S71_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.90.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.90.vcf.bgz