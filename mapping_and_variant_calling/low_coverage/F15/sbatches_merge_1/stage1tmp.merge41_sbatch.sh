#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge41
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge41_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge41_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_8127_S109_L003.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2354_S7_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2720_S20_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3154_S74_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3298_S36_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3117_S83_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2445_S88_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3075_S53_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2336_S2_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3157_S17_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.41.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.41.vcf.bgz