#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge45
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge45_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge45_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2547_S61_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8237_S63_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3028_S19_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2838_S91_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2848_S3_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3185_S41_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2864_S11_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2391_S45_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2814_F15_S76_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2363_S62_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.45.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.45.vcf.bgz