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
bcftools merge /home/tilman/storage2/F2/data/1373_F2_S30_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_829_S79_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1291_S73_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_899_S46_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1220_S47_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1204_S34_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/413_F2_S40_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1188_S18_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1146_S76_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_600_S67_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.16.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.16.vcf.bgz