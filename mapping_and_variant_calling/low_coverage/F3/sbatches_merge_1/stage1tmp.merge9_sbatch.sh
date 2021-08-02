#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge9
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge9_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge9_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3422_F3_S61_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3518_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3166_F3_S10_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3544_F3_S74_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3581_F3_S12_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3512_F3_S43_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3385_F3_S24_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3426_F3_S65_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3254_F3_S93_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3189_F3_S32_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.9.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.9.vcf.bgz