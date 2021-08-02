#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge35
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge35_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge35_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3370_F3_S10_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3165_F3_S9_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3476_F3_S13_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3542_F3_S72_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3471_F3_S9_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3253_F3_S92_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3437_F3_S76_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3575_F3_S6_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3199_F3_S42_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3479_F3_S16_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.35.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.35.vcf.bgz