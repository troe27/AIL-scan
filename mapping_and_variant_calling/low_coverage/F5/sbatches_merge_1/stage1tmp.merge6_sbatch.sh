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
bcftools merge /home/tilman/storage/F5/data/6277_F5_S19_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6362_F5_S79_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6354_F5_S44_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6320_F5_S34_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6290_F5_S23_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6261_F5_S10_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6156_F5_S74_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6135_F5_S68_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6357_F5_S45_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6210_F5_S94_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.6.vcf.bgz