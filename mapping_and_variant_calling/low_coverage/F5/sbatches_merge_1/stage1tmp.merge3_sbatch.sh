#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1
#SBATCH -o ./sbatches_merge_1_%j.out
#SBATCH -e ./sbatches_merge_1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
bcftools merge /home/tilman/storage/F5/data/6306_F5_S30_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6223_F5_S1_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6249_F5_S8_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6227_F5_S70_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6185_F5_S82_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6308_F5_S31_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6093_F5_S59_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6398_F5_S59_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6349_F5_S43_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6180_F5_S65_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz