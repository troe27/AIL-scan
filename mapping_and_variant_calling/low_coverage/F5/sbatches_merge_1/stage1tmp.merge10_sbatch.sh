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
bcftools merge /home/tilman/storage/F5/data/6393_F5_S58_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6295_F5_S25_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6183_F5_S66_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6317_F5_S75_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6327_F5_S37_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6244_F5_S6_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6305_F5_S29_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6148_F5_S63_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6191_F5_S83_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6235_F5_S4_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.10.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.10.vcf.bgz