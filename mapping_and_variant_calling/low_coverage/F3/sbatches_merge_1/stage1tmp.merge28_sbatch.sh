#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge28
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge28_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge28_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3322_F3_S61_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3222_F3_S65_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3396_F3_S35_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3315_F3_S55_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3533_F3_S63_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3411_F3_S50_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3408_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3246_F3_S86_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3337_F3_S76_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3475_F3_S12_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.28.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.28.vcf.bgz