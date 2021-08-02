#!/bin/bash
## script to run the snakemake process that submits jobs to the scheduling engine.
module load bioinfo-tools
module load snakemake
snakemake -j 99 -s ./parallel_filtering_v2.snek --cluster-config config/slurm.json  --cluster config/slurm_scheduler.py  --cluster-status config/slurm_status.py --rerun-incomplete
