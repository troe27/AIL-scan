#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge38
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge38_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge38_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3464_F3_S23_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3478_F3_S29_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3490_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3527_F3_S57_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3517_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3273_F3_S15_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3345_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3408_F3_S47_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3191_F3_S34_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3363_F3_S7_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.38.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.38.vcf.bgz