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
bcftools merge /home/tilman/storage2/F2/data/F2_1117_S53_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_441_S27_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_961_S1_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_979_S18_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_616_S82_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_817_S71_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1426_F2_S70_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_595_S62_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_360_S83_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_294_S59_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.20.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.20.vcf.bgz