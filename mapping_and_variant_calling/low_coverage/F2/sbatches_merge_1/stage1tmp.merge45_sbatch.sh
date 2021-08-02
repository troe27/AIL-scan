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
bcftools merge /home/tilman/storage2/F2/data/F2_206_S20_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_764_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_681_S47_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1435_F2_S76_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_805_S60_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_548_S20_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_200_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_563_S33_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_633_S2_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_576_S44_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.45.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.45.vcf.bgz