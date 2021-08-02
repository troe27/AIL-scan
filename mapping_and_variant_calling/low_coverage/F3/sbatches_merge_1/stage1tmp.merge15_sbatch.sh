#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge15
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge15_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge15_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3530_F3_S60_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3155_F3_S96_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3183_F3_S27_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3391_F3_S30_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3233_F3_S75_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3232_F3_S74_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3225_F3_S68_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3529_F3_S59_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3465_F3_S3_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3428_F3_S67_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.15.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.15.vcf.bgz