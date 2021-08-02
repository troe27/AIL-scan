#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge13
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge13_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge13_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3356_F3_S93_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3242_F3_S82_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3202_F3_S45_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3601_F3_S31_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3562_F3_S88_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3227_F3_S70_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3272_F3_S14_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3181_F3_S25_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3323_F3_S62_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3498_F3_S31_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.13.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.13.vcf.bgz