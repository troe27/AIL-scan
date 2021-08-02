#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge17
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge17_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge17_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3285_F3_S26_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3469_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3175_F3_S19_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3374_F3_S14_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3207_F3_S50_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3389_F3_S28_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3415_F3_S54_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3469_F3_S7_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3201_F3_S44_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3345_F3_S7_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.17.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.17.vcf.bgz