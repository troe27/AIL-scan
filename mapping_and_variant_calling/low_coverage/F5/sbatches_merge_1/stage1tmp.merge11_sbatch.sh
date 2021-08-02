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
bcftools merge /home/tilman/storage/F5/data/6178_F5_S81_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6391_F5_S56_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6270_F5_S16_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6177_F5_S80_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6292_F5_S24_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6168_F5_S20_L006.cleaned.vcf.bgz /home/tilman/storage/F5/data/6375_F5_S51_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6276_F5_S18_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6291_F5_S73_L003.cleaned.vcf.bgz /home/tilman/storage/F5/data/6121_F5_S66_L003.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.11.vcf.bgz && tabix -p vcf /home/tilman/storage/F5/merge_vcf_stage1/run001.tmp.merge.11.vcf.bgz