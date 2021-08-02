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
bcftools merge /home/tilman/storage2/F2/data/F2_604_S71_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1449_F2_S81_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1142_S73_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_714_S78_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1254_S76_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1428_F2_S71_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1231_S57_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_566_S36_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_313_S64_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1080_S19_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.50.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.50.vcf.bgz