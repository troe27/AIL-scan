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
bcftools merge /home/tilman/storage2/F2/data/F2_879_S29_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1295_S77_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1389_F2_S42_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1216_S43_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_952_S90_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/410_F2_S37_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_317_S66_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1341_F2_S10_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_838_S88_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1218_S45_L005.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.25.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.25.vcf.bgz