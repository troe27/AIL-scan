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
bcftools merge /home/tilman/storage/F4/data/3296_F4_S49_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3506_F4_S5_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3381_F4_S66_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3538_F4_S10_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3776_F4_S55_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3450_F4_S85_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3277_F4_S46_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3371_F4_S65_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3368_F4_S63_L003.cleaned.vcf.bgz /home/tilman/storage/F4/data/3768_F4_S54_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.8.vcf.bgz && tabix -p vcf /home/tilman/storage/F4/merge_vcf_stage1/run001.tmp.merge.8.vcf.bgz