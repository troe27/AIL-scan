#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge48
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge48_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge48_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3525_F3_S55_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3400_F3_S10_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3462_F3_S96_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3456_F3_S92_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3441_F3_S19_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3196_F3_S39_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3517_F3_S35_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3540_F3_S70_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3431_F3_S70_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3261_F3_S3_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.48.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.48.vcf.bgz