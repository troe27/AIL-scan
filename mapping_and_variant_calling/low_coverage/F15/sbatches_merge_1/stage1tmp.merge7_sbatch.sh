#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge7
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge7_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge7_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2970_S71_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3254_S74_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2371_F15_S82_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3232_S71_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3204_S56_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2452_S92_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8391_S17_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2512_S35_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2525_S44_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8364_S74_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.7.vcf.bgz