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
bcftools merge /home/tilman/storage2/F3/data/3365_F3_S8_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3528_F3_S58_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3186_F3_S29_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3587_F3_S18_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3418_F3_S57_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3195_F3_S38_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3312_F3_S52_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3446_F3_S84_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3500_F3_S33_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3169_F3_S13_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.41.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.41.vcf.bgz