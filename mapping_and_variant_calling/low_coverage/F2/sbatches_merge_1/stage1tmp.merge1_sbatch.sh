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
bcftools merge /home/tilman/storage2/F2/data/F2_1026_S62_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_702_S68_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_787_S42_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_504_S68_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_425_S20_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1091_S28_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1250_S72_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_638_S7_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_983_S22_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_585_S52_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1355_F2_S21_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz