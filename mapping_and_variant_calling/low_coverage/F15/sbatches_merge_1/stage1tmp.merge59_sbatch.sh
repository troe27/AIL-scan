#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge59
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge59_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge59_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2478_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3235_S84_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2356_S18_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2346_S11_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2466_S6_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3114_S81_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2982_S80_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3015_S7_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2408_S57_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2433_S79_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.59.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.59.vcf.bgz