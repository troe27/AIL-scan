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
bcftools merge /home/tilman/storage/F16/data/F16_7228_S56_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7216_S51_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7324_S93_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7419_S30_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7336_S3_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7187_S39_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7266_S70_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7238_S60_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7284_S77_L008.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7376_S16_L003.cleaned.vcf.bgz /home/tilman/storage/F16/data/F16_7229_S57_L008.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage/F16/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz