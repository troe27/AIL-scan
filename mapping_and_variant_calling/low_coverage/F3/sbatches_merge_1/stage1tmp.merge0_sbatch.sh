#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge0
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge0_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge0_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3394_F3_S33_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3319_F3_S59_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3589_F3_S20_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3442_F3_S81_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3223_F3_S66_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3215_F3_S58_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3597_F3_S28_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3208_F3_S51_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3543_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3247_F3_S87_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3325_F3_S64_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz