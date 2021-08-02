#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge27
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge27_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge27_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3

bcftools merge /home/tilman/storage2/F3/data/3511_F3_S42_L003.cleaned.vcf.bgz \
               /home/tilman/storage2/F3/data/3504_F3_S36_L003.cleaned.vcf.bgz \
               /home/tilman/storage2/F3/data/3578_F3_S9_L003.cleaned.vcf.bgz \
               /home/tilman/storage2/F3/data/3590_F3_S21_L003.cleaned.vcf.bgz \
               /home/tilman/storage2/F3/data/3265_F3_S7_L002.cleaned.vcf.bgz \
               /home/tilman/storage2/F3/data/3264_F3_S6_L002.cleaned.vcf.bgz \
               /home/tilman/storage2/F3/data/3293_F3_S33_L002.cleaned.vcf.bgz \
               /home/tilman/storage2/F3/data/3435_F3_S74_L002.cleaned.vcf.bgz \
               /home/tilman/storage2/F3/data/3553_F3_Sx_merged.cleaned.vcf.bgz \
               /home/tilman/storage2/F3/data/3249_F3_S89_L001.cleaned.vcf.bgz \
            -O z \
            --threads 4 \
            -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.27.vcf.bgz \ 
            && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.27.vcf.bgz
