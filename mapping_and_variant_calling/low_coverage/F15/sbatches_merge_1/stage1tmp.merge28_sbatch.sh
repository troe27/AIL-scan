#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge28
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge28_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge28_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2539_S54_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2619_S12_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2806_S74_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3008_S2_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8205_S92_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8675_S82_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2508_S29_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3286_S26_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2761_S35_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3222_S73_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.28.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.28.vcf.bgz