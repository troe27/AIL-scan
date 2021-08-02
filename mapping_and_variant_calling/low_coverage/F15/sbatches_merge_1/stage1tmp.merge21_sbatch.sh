#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge21
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge21_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge21_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_3271_S14_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3039_S27_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/2746_F15_S87_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8215_S94_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2527_S46_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2949_S56_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8323_S12_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2803_S71_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8615_S67_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2723_S23_L006.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.21.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.21.vcf.bgz