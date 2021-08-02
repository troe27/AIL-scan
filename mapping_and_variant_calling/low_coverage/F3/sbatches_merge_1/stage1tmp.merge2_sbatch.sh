#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge2
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge2_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge2_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3543_F3_S73_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3360_F3_S4_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3226_F3_S69_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3494_F3_S28_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3258_F3_S96_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3295_F3_S35_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3585_F3_S16_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3502_F3_S35_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3426_F3_S14_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3514_F3_S45_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3163_F3_S8_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz