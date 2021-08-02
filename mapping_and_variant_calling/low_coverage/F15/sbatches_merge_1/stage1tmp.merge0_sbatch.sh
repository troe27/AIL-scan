#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge0
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge0_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge0_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3109_S76_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2808_S70_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2431_F15_S67_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2393_S61_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2604_S4_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2715_S16_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2382_S39_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2752_F15_S91_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2480_S23_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3259_S73_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3251_S1_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz