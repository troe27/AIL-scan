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
bcftools merge /home/tilman/storage2/F2/data/F2_1004_S43_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_355_S78_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1002_S41_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1155_S85_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1038_S74_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_424_S19_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_722_S85_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_811_S66_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_216_S26_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1455_F2_S85_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.52.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.52.vcf.bgz