#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge54
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge54_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge54_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2355_S17_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2514_S37_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3322_S56_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2562_S27_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2772_S66_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3244_S91_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8543_S18_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3136_S59_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8170_S97_L003.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2827_S83_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.54.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.54.vcf.bgz