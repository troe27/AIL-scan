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
bcftools merge /home/tilman/storage2/F2/data/F2_1001_S40_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1008_S47_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_295_S60_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1043_S79_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_881_S31_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_479_S50_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_916_S59_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1217_S44_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_737_S1_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_542_S15_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.40.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.40.vcf.bgz