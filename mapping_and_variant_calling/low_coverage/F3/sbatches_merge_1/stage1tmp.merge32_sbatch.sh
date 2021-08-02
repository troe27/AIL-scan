#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge32
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge32_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge32_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3386_F3_S25_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3294_F3_S34_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3188_F3_S31_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3361_F3_S5_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3398_F3_S37_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3467_F3_S25_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3410_F3_S49_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3230_F3_S72_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3334_F3_S73_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3333_F3_S72_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.32.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.32.vcf.bgz