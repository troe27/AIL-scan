#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge23
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge23_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge23_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3405_F3_S44_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3290_F3_S30_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3347_F3_S84_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3217_F3_S60_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3520_F3_S51_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3218_F3_S61_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3610_F3_S40_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3593_F3_S24_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3472_F3_S10_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3255_F3_S94_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.23.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.23.vcf.bgz