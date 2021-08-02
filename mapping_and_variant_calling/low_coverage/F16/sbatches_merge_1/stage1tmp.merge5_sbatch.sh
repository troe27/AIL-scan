#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 8
#SBATCH -J ./sbatches_merge_1
#SBATCH -o ./sbatches_merge_1_%j.out
#SBATCH -e ./sbatches_merge_1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
bcftools merge /home/tilman/storage/F16/data/F16_7378_S17_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7385_S18_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7417_S27_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7299_S83_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7403_S23_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7338_S5_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7327_S94_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7308_S86_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7295_S82_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7219_S53_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7249_S64_L008.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz && tabix -p vcf /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz