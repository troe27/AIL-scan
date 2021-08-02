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
bcftools merge /home/tilman/storage2/F2/data/F2_800_S55_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_894_S42_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_735_S95_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_890_S39_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_555_S25_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_850_S2_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1110_S46_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_809_S64_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1084_S23_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_222_S29_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.48.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.48.vcf.bgz