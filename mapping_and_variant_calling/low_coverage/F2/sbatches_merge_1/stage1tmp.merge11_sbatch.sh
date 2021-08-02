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
bcftools merge /home/tilman/storage2/F2/data/F2_663_S31_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_869_S20_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_668_S35_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_219_S27_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1238_S62_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_783_S38_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_938_S77_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_444_S30_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1041_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1290_S72_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.11.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.11.vcf.bgz