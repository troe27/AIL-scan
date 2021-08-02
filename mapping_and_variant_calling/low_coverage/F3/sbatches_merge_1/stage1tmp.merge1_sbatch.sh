#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge1
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge1_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3572_F3_S3_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3464_F3_S2_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3278_F3_S20_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3466_F3_S4_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3381_F3_S20_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3600_F3_S30_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3443_F3_S82_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3583_F3_S14_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3303_F3_S43_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3182_F3_S26_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3480_F3_S30_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz