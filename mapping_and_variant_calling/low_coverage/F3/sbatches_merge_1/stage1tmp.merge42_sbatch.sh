#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge42
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge42_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge42_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3522_F3_S11_L006.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3607_F3_S37_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3384_F3_S23_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3448_F3_S85_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3373_F3_S13_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3424_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3369_F3_S9_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3521_F3_S52_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3260_F3_S2_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3267_F3_S9_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.42.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.42.vcf.bgz