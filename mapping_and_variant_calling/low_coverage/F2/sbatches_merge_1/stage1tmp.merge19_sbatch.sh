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
bcftools merge /home/tilman/storage2/F2/data/F2_1140_S71_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1245_S67_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_422_S18_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_698_S64_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1255_S77_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1248_S70_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_730_S92_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1036_S72_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1471_F2_S91_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1453_F2_S83_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.19.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.19.vcf.bgz