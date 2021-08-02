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
bcftools merge /home/tilman/storage2/F2/data/F2_577_S45_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1144_S75_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_614_S80_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_814_S68_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_210_S23_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1167_S95_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_771_S28_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_806_S61_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1030_S66_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_715_S79_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.27.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.27.vcf.bgz