#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge21
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge21_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge21_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3558_F3_S85_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3573_F3_S4_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3535_F3_S65_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3172_F3_S16_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3582_F3_S41_L008.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3198_F3_S41_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3557_F3_S84_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3259_F3_S1_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3307_F3_S47_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3567_F3_S93_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.21.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.21.vcf.bgz