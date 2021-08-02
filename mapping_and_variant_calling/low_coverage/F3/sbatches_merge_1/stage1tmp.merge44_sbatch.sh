#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge44
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge44_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge44_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3453_F3_S89_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3357_F3_S1_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3403_F3_S42_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3331_F3_S70_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3478_F3_S15_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3234_F3_S76_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3419_F3_S58_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3603_F3_S33_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3509_F3_S40_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3563_F3_S39_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.44.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.44.vcf.bgz