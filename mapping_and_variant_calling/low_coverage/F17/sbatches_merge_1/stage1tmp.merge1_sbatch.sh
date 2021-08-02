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
bcftools merge /home/tilman/storage/F17/data/F17_1322_S63_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1177_S39_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1354_S68_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1281_S55_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1247_S49_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1302_S59_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1269_S53_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1169_S38_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1160_S37_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1259_S52_L003.cleaned.vcf.bgz /home/tilman/storage/F17/data/F17_1287_S57_L003.cleaned.vcf.bgz -O z --threads 8 -o /home/tilman/storage/F17/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage/F17/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz