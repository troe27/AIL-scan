#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge6
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge6_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge6_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3580_F3_S11_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3545_F3_S75_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3376_F3_S16_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3516_F3_S47_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3359_F3_S3_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3565_F3_S40_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3388_F3_S27_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3515_F3_S46_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3452_F3_S88_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3237_F3_S79_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz