#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge47
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge47_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge47_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2390_S44_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2926_S45_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3047_S33_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2371_S29_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3020_S12_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2613_S52_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2904_S32_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3165_S60_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8265_S84_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2758_S62_L007.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.47.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.47.vcf.bgz