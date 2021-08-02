#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge11
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge11_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge11_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3421_F3_S60_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3508_F3_S39_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3425_F3_S64_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3602_F3_S32_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3190_F3_S33_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3555_F3_S83_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3399_F3_S38_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3424_F3_S63_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3427_F3_S66_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3565_F3_S91_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.11.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.11.vcf.bgz