#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge30
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge30_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge30_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3495_F3_S29_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3314_F3_S54_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3534_F3_S64_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3160_F3_S5_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3532_F3_S62_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3276_F3_S18_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3332_F3_S71_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3203_F3_S46_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3591_F3_S22_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3420_F3_S59_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.30.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.30.vcf.bgz