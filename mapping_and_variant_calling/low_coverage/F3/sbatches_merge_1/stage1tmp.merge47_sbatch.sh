#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge47
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge47_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge47_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3284_F3_S25_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3341_F3_S79_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3244_F3_S84_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3553_F3_S38_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3316_F3_S56_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3248_F3_S88_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3288_F3_S28_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3271_F3_S13_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3483_F3_S18_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3531_F3_S61_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.47.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.47.vcf.bgz