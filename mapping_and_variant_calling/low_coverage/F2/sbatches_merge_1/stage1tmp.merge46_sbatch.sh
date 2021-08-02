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
bcftools merge /home/tilman/storage2/F2/data/F2_579_S47_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1242_S65_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1331_F2_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1119_S55_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_919_S62_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/388_F2_S17_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_988_S27_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_831_S81_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1023_S59_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_474_S49_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.46.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.46.vcf.bgz