#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge42
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge42_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge42_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2925_S44_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3042_S29_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2752_S44_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2467_S7_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2794_S68_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2748_S43_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2379_S36_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2592_S46_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2837_S90_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2422_S15_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.42.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.42.vcf.bgz