#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge36
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge36_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge36_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F3/data/3205_F3_S48_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3311_F3_S51_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3383_F3_S22_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3184_F3_S28_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3200_F3_S43_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3378_F3_S18_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3377_F3_S17_L002.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3167_F3_S11_L001.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3491_F3_S26_L003.cleaned.vcf.bgz /home/tilman/storage2/F3/data/3161_F3_S6_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.36.vcf.bgz && tabix -p vcf /home/tilman/storage2/F3/merge_vcf_stage1/run001.tmp.merge.36.vcf.bgz