#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge40
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge40_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge40_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2738_S35_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3162_S22_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3292_S107_L003.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8219_S3_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8345_S14_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3155_S75_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2386_S41_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2370_S28_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2818_S37_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2804_S72_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.40.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.40.vcf.bgz