#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 8
#SBATCH -J ./sbatches_merge_1
#SBATCH -o ./sbatches_merge_1_%j.out
#SBATCH -e ./sbatches_merge_1_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate v3
bcftools merge /home/tilman/storage/F13/data/F13_1275_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/1383_F13_S51_L005.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1329_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1299_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1348_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1375_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1340_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/1302_F13_S53_L005.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1327_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1359_Sx_merged.cleaned.vcf.bgz /home/tilman/storage/F13/data/F13_1388_Sx_merged.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz && tabix -p vcf /home/tilman/storage/F13/merge_vcf_stage1/run001.tmp.merge.3.vcf.bgz
