#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge24
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge24_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge24_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2732_S56_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3306_S41_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3209_S61_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3164_S24_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2938_S81_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2810_S76_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2569_S77_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2882_S21_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3176_S32_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2597_S47_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.24.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.24.vcf.bgz