#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge18
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge18_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge18_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3513_F3_S44_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3353_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3214_F3_S57_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3490_F3_S31_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3497_F3_S30_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3570_F3_S1_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3154_F3_S95_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3407_F3_S46_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3519_F3_S50_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3510_F3_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.18.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.18.vcf.bgz