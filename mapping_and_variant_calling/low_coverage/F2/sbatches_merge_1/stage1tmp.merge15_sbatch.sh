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
bcftools merge /home/tilman/storage2/F2/data/F2_1017_Sx_merged.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_513_S77_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1393_F2_S46_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1434_F2_S75_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1169_S1_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_779_S35_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_975_S14_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_819_S72_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1143_S74_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_930_S69_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.15.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.15.vcf.bgz