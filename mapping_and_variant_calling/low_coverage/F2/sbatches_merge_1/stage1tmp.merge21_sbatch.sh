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
bcftools merge /home/tilman/storage2/F2/data/F2_1225_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_997_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_631_S1_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_493_S60_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1275_S92_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_683_S49_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1423_F2_S67_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_516_S80_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_762_S20_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_812_S67_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.21.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.21.vcf.bgz