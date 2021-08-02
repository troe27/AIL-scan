#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge33
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge33_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge33_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/2367_F15_S79_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2446_S89_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3227_S78_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8145_S95_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2735_S32_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2333_S3_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2912_S35_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3237_S86_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2522_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3077_S55_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.33.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.33.vcf.bgz