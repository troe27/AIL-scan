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
bcftools merge /home/tilman/storage/F6/data/8417_F6_S87_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8572_F6_S46_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8413_F6_S23_L006.cleaned.vcf.bgz /home/tilman/storage/F6/data/8588_F6_S53_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8434_F6_S92_L003.cleaned.vcf.bgz /home/tilman/storage/F6/data/8558_F6_S41_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8546_F6_S36_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8469_F6_S9_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8638_F6_S72_L004.cleaned.vcf.bgz /home/tilman/storage/F6/data/8565_F6_S43_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.8.vcf.bgz && tabix -p vcf /home/tilman/storage/F6/merge_vcf_stage1/run001.tmp.merge.8.vcf.bgz