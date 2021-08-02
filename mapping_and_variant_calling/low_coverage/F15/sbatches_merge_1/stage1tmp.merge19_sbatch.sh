#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge19
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge19_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge19_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3064_S45_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2807_S30_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2825_S31_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2802_S70_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2851_S79_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2775_S31_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2520_S41_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2454_S94_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2810_F15_S73_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2731_S29_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.19.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.19.vcf.bgz