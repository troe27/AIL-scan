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
bcftools merge /home/tilman/storage2/F2/data/F2_1018_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_717_S80_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_636_S5_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1294_S76_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1072_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1010_S49_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_672_S38_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_582_S49_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_790_S45_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1407_F2_S55_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.37.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.37.vcf.bgz