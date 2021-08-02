#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge64
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge64_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge64_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2458_S96_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2892_S28_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2988_S85_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2533_S21_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3268_S93_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2373_F15_S84_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2372_S9_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2568_S76_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2608_S7_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2942_S83_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.64.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.64.vcf.bgz