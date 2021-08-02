#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge43
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge43_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge43_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3506_F3_S38_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3335_F3_S74_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3351_F3_S88_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3216_F3_S59_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3469_F3_S27_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3507_F3_S10_L006.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3211_F3_S54_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3275_F3_S17_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3236_F3_S78_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3344_F3_S81_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.43.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.43.vcf.bgz