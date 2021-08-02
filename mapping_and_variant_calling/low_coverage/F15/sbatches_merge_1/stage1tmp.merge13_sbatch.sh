#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge13
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge13_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge13_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3123_S87_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2435_S19_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2817_S73_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2548_S36_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2791_S62_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2578_S83_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3122_S86_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3076_S54_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3007_S1_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2723_S55_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.13.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.13.vcf.bgz