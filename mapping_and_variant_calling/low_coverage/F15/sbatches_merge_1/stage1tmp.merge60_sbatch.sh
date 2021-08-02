#!/bin/bash -l
#SBATCH -A snic2018-3-170
#SBATCH -t 48:0:0 
#SBATCH -p core -n 4
#SBATCH -J ./sbatches_merge_1/stage1tmp.merge60
#SBATCH -o ./sbatches_merge_1/stage1tmp.merge60_%j.out
#SBATCH -e ./sbatches_merge_1/stage1tmp.merge60_%j.error
#SBATCH --mail-user tilman.ronneburg@imbim.uu.se
#SBATCH --mail-type=ALL
#SBATCH --get-user-env
##command underneath this##
source activate venv3
bcftools merge /home/tilman/storage2/F15/data/F15_2399_S50_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_8289_S76_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3293_S76_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2558_S70_L005.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3026_S18_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3246_S92_L007.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2762_S49_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_2417_S65_L008.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3025_S17_L006.cleaned.vcf.bgz /home/tilman/storage2/F15/data/F15_3323_S57_L008.cleaned.vcf.bgz -O z --threads 4 -o /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.60.vcf.bgz && tabix -p vcf /home/tilman/storage2/F15/merge_vcf_stage1/run001.tmp.merge.60.vcf.bgz