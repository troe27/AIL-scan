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
bcftools merge /home/tilman/storage2/F2/data/F2_841_S89_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1035_S71_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1129_S65_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/402_F2_S29_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1070_S10_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_847_S95_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1414_F2_S60_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_920_S63_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_845_S93_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_569_S39_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.28.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.28.vcf.bgz