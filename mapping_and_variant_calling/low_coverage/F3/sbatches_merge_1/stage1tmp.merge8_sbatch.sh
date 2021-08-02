#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge8
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge8_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge8_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3289_F3_S29_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3204_F3_S47_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3397_F3_S36_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3560_F3_S87_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3269_F3_S11_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3328_F3_S67_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3536_F3_S66_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3270_F3_S12_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3541_F3_S71_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3239_F3_S81_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.8.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.8.vcf.bgz