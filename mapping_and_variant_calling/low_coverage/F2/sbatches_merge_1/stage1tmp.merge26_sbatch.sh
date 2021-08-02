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
bcftools merge /home/tilman/storage2/F2/data/1406_F2_S54_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_690_S56_L002.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_816_S70_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_520_S83_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1283_S66_L005.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_1141_S72_L004.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_503_S67_L001.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_751_S13_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/F2_145_S4_L007.cleaned.vcf.bgz /home/tilman/storage2/F2/data/1328_F2_S2_L001.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.26.vcf.bgz && tabix -p vcf /home/tilman/storage2/F2/merge_vcf_stage1/run001.tmp.merge.26.vcf.bgz