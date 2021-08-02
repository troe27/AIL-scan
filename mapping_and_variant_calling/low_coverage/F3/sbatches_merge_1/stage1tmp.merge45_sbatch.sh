#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge45
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge45_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge45_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3171_F3_S15_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3429_F3_S68_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3219_F3_S62_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3277_F3_S19_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3432_F3_S17_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3317_F3_S57_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3400_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3178_F3_S22_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3433_F3_S72_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3329_F3_S68_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.45.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.45.vcf.bgz