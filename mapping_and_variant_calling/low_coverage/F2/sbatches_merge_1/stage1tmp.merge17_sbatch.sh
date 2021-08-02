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
bcftools merge /home/tilman/storage2/F2/data/F2_445_S31_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1191_S21_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_534_S9_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_448_S34_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_999_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_527_S2_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_689_S55_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_903_S50_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1198_S28_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_584_S51_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.17.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.17.vcf.bgz