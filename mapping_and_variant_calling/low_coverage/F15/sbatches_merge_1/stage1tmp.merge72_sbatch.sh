#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge72
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge72_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge72_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2507_S28_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2904_S51_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3070_S76_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3102_S57_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8211_S93_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3136_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2560_S72_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2481_S14_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3161_S21_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3242_S90_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.72.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.72.vcf.bgz