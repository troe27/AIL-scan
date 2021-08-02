#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge25
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge25_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge25_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3151_S67_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2430_F15_S66_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2471_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3338_S69_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2972_S54_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8121_S102_L003.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3273_S88_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3141_S6_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2850_S5_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2887_S24_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.25.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.25.vcf.bgz