#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J new_merge16
#SBATCH -o new_merge16_%j.out
#SBATCH -e new_merge16_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
module load bioinfo-tools
module load bcftools
module load htslib
source activate venv3

bcftools merge /home/tilman/storage2/F15/data/F15_2964_S89_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8197_S91_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2489_S19_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3063_S44_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2376_S33_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3053_S53_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2425_S71_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2959_S62_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3165_S25_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2756_S46_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.16.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.16.vcf.bgz
