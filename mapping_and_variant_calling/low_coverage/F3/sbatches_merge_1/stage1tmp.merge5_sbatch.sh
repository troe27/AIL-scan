#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge5
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge5_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge5_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3467_F3_S5_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3362_F3_S6_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3352_F3_S89_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3492_F3_S27_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3342_F3_S80_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3427_F3_S15_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3266_F3_S8_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3596_F3_S27_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3608_F3_S38_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3380_F3_S19_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz