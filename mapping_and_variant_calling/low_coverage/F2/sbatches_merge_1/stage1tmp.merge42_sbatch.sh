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
bcftools merge /home/tilman/storage2/F2/data/1410_F2_S57_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1205_S35_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_639_S8_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1122_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1380_F2_S35_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/386_F2_S15_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1286_S68_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_874_S24_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1113_S49_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_610_S76_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.42.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.42.vcf.bgz