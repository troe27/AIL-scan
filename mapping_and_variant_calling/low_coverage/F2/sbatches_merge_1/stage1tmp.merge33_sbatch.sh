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
bcftools merge /home/tilman/storage2/F2/data/F2_802_S57_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1241_S64_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_602_S69_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_908_S53_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_537_S11_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_440_S26_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_654_S22_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_482_S51_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_369_S4_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1236_S60_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.33.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.33.vcf.bgz