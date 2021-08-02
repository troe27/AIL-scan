#!/bin/bash

source activate v3 

mkdir /home/tilman/storage/F6/merge_vcf_stage1
mkdir ./sbatches_merge_1

python ../create_merge.py --infolder /home/tilman/storage/F6/data/ --prefix /home/tilman/storage/F6/merge_vcf_stage1/run001  --make_sbatch --threads 4 --bcftools_path bcftools --batchsize 10 --scriptprefix ./sbatches_merge_1/stage1

#execute : 
ls ./sbatches_merge_1/stage1* | xargs -n1 -I{} bash -c "sbatch  {}; sleep 2s" # sbatch had i/o issues
