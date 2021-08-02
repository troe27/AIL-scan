#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge34
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge34_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge34_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3380_F3_S9_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3428_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3349_F3_S86_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3471_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3460_F3_S95_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3321_F3_S60_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3441_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3313_F3_S53_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3463_F3_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3565_F3_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.34.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.34.vcf.bgz