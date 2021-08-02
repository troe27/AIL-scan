#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge16
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge16_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge16_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3505_F3_S37_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3338_F3_S77_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3576_F3_S7_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3480_F3_S17_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3458_F3_S9_L006.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3292_F3_S32_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3416_F3_S12_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3455_F3_S91_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3159_F3_S4_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3477_F3_S14_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.16.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.16.vcf.bgz