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
bcftools merge /home/tilman/storage/F16/data/F16_7248_S31_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7263_S68_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7331_S1_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7407_S24_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7193_S42_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7310_S87_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7275_S75_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7312_S88_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7316_S90_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7292_S81_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7370_S13_L003.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz