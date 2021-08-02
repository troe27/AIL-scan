#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge73
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge73_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge73_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3150_S15_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3137_S3_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3331_S64_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2364_S23_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2349_S12_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8125_S87_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2559_S71_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8359_S73_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3052_S36_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2471_S44_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.73.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.73.vcf.bgz