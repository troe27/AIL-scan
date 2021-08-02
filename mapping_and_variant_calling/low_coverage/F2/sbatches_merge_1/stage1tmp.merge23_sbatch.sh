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
bcftools merge /home/tilman/storage2/F2/data/F2_547_S19_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_969_S9_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_746_S9_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_878_S28_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1124_S60_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_453_S38_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_641_S10_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_917_S60_L006.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_658_S26_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_649_S17_L002.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.23.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.23.vcf.bgz