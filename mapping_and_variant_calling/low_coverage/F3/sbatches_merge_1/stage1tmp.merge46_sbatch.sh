#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge46
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge46_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge46_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3548_F3_S12_L006.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3484_F3_S19_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3501_F3_S34_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3382_F3_S21_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3387_F3_S26_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3355_F3_S92_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3445_F3_S83_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3392_F3_S31_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3330_F3_S69_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3468_F3_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.46.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.46.vcf.bgz