#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge82
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge82_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge82_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_8221_S83_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3094_S56_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2809_S75_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2861_S49_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2517_S39_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2602_S2_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2411_S59_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3321_S55_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2832_S77_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2477_S12_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.82.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.82.vcf.bgz