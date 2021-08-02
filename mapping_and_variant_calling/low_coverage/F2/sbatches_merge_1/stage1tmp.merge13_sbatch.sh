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
bcftools merge /home/tilman/storage2/F2/data/F2_804_S59_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_786_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_675_S41_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1381_F2_S36_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1194_S24_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_427_S21_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_712_S76_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1293_S75_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_163_S3_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_709_S73_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.13.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.13.vcf.bgz