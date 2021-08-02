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
bcftools merge /home/tilman/storage/F10/data/3795_F10_S29_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3793_F10_S27_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3757_F10_S12_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3731_F10_S1_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4346_F10_S81_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3786_F10_S25_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3856_F10_S57_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3756_F10_S11_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4315_F10_S78_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/3732_F10_S2_L004.cleaned.vcf.bgz /home/tilman/storage/F10/data/4380_F10_S86_L004.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz && tabix -p vcf /home/tilman/storage/F10/merge_vcf_stage1/run001.tmp.merge.4.vcf.bgz