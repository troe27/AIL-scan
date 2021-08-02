#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge25
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge25_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge25_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3595_F3_S26_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3375_F3_S15_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3609_F3_S39_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3433_F3_S18_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3554_F3_S82_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3156_F3_S1_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3193_F3_S36_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3450_F3_S87_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3577_F3_S8_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3306_F3_S46_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.25.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.25.vcf.bgz