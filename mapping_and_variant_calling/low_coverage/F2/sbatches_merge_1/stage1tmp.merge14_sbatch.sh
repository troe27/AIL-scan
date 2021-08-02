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
bcftools merge /home/tilman/storage2/F2/data/F2_679_S45_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1202_S32_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_489_S57_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_807_S62_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_734_S94_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1014_S52_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1052_S88_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_789_S44_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_596_S63_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1032_S68_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.14.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.14.vcf.bgz