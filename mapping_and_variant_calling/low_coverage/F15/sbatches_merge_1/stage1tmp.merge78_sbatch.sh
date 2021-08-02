#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge78
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge78_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge78_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2513_S36_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2757_S47_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2846_S1_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2541_S56_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3072_S50_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2879_S19_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3049_S52_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3334_S65_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3017_S9_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2603_S3_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.78.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.78.vcf.bgz