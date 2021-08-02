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
bcftools merge /home/tilman/storage2/F2/data/F2_1181_S12_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1463_F2_S86_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_745_S8_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_754_S16_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_896_S44_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1260_S80_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_231_S33_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1139_S70_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_719_S82_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_932_S71_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.38.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.38.vcf.bgz