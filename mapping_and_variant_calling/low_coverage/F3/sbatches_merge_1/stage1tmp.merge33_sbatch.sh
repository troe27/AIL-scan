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
bcftools merge /home/tilman/storage2/F3/data/3177_F3_S21_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3153_F3_S94_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3539_F3_S69_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3402_F3_S41_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3268_F3_S10_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3466_F3_S24_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3604_F3_S34_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3566_F3_S92_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3440_F3_S79_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3586_F3_S17_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.33.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.33.vcf.bgz