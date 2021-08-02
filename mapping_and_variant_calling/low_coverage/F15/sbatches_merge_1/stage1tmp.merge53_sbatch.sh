#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge53
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge53_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge53_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3296_S34_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2407_S56_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2360_S21_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3087_S63_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2747_S42_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3171_S30_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8233_S6_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2554_S66_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3275_S82_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2570_S78_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.53.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.53.vcf.bgz