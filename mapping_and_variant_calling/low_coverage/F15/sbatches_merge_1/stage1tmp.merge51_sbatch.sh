#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge51
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge51_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge51_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2940_S53_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3312_S47_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2711_S13_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3118_S84_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2958_S61_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3093_S54_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3119_S85_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8497_S75_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3309_S44_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2430_S76_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.51.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.51.vcf.bgz