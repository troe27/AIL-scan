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
bcftools merge /home/tilman/storage/F6/data/8488_F6_S18_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8582_F6_S51_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8581_F6_S50_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8550_F6_S38_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8433_F6_S91_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8568_F6_S45_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8511_F6_S25_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8499_F6_S21_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8479_F6_S15_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8529_F6_S30_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8665_F6_S82_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz && tabix -p vcf /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.5.vcf.bgz