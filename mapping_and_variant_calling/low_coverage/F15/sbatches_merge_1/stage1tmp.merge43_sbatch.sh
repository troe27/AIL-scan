#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge43
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge43_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge43_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_8201_S76_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2402_S13_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2931_S47_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2596_S91_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2878_S18_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3229_S80_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2367_S26_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2820_S74_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2330_S2_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2551_S63_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.43.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.43.vcf.bgz