#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge40
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge40_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge40_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3358_F3_S2_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3224_F3_S67_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3550_F3_S79_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3301_F3_S41_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3424_F3_S13_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3251_F3_S91_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3417_F3_S56_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3463_F3_S22_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3563_F3_S89_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3390_F3_S29_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.40.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.40.vcf.bgz