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
bcftools merge /home/tilman/storage/F6/data/8463_F6_S8_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8573_F6_S47_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8462_F6_S7_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8497_F6_S20_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8636_F6_S70_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8455_F6_S5_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8419_F6_S88_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8478_F6_S14_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8510_F6_S24_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8624_F6_S65_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8607_F6_S60_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz