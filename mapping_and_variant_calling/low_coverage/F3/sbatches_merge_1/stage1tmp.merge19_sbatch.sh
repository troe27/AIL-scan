#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge19
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge19_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge19_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3428_F3_S16_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3299_F3_S39_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3350_F3_S87_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3221_F3_S64_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3187_F3_S30_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3245_F3_S85_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3510_F3_S41_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3371_F3_S11_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3459_F3_S94_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3287_F3_S27_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.19.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.19.vcf.bgz