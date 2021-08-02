#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge10
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge10_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge10_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3158_F3_S3_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3400_F3_S39_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3605_F3_S35_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3499_F3_S32_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3416_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3162_F3_S7_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3274_F3_S16_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3500_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3235_F3_S77_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3346_F3_S83_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.10.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.10.vcf.bgz