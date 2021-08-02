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
bcftools merge /home/tilman/storage/F5/data/6239_F5_S5_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6278_F5_S20_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6260_F5_S72_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6176_F5_S79_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6169_F5_S78_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6325_F5_S36_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6164_F5_S77_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6297_F5_S27_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6268_F5_S15_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6111_F5_S64_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6337_F5_S40_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.2.vcf.bgz