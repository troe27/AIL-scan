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
bcftools merge /home/tilman/storage/F5/data/6193_F5_S85_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6163_F5_S76_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6102_F5_S61_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6262_F5_S11_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6161_F5_S75_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6275_F5_S17_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6323_F5_S76_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6345_F5_S42_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6284_F5_S21_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6333_F5_S38_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz