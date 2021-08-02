#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge1
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge1_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2755_S45_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2998_S47_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2727_S26_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2528_S47_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2377_S34_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3300_S37_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2871_S94_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2865_S12_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2564_S73_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3257_S4_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2911_S34_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz