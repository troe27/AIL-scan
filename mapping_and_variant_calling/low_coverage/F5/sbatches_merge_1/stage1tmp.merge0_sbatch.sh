#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1
#SBATCH -o ./sbatches_merge_1_%j.out
#SBATCH -e ./sbatches_merge_1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
bcftools merge /home/tilman/storage/F5/data/6326_F5_S77_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6134_F5_S67_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6105_F5_S62_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6318_F5_S33_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6228_F5_S2_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6152_F5_S73_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6194_F5_S67_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6090_F5_S58_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6359_F5_S46_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6374_F5_S50_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6140_F5_S69_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.0.vcf.bgz