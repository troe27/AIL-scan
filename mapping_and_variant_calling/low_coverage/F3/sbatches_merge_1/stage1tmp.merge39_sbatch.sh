#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge39
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge39_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge39_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3353_F3_S90_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3210_F3_S53_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3213_F3_S56_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3487_F3_S22_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3599_F3_S29_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3406_F3_S45_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3518_F3_S49_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3510_F3_S34_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3281_F3_S23_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3180_F3_S24_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.39.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.39.vcf.bgz