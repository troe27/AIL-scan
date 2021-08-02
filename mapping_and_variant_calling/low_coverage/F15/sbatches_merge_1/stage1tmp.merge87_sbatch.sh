#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge87
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge87_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge87_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2462_S3_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2584_S43_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2749_F15_S90_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2739_S36_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3277_S17_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2874_S86_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2789_S36_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3324_S58_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3297_S35_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2618_S11_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.87.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.87.vcf.bgz