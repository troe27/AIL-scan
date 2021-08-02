#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge3
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge3_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge3_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3393_F3_S32_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3300_F3_S40_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3582_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3543_F3_S37_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3173_F3_S17_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3582_F3_S13_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3238_F3_S80_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3220_F3_S63_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3408_F3_S11_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3194_F3_S37_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3485_F3_S20_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz