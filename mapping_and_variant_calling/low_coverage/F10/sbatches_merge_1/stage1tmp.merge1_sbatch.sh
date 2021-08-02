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
bcftools merge /home/tilman/storage/F10/data/4298_F10_S72_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3794_F10_S28_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3814_F10_S38_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4381_F10_S87_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3751_F10_S9_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3827_F10_S45_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3805_F10_S35_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3740_F10_S6_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3822_F10_S42_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3863_F10_S61_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3833_F10_S47_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz && tabix -p vcf /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.1.vcf.bgz