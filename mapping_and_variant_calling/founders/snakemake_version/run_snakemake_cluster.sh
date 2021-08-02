#!/bin/bash
module load bioinfo-tools
module load snakemake
snakemake  -j 150 -s ./map_and_call_founders.snek --cluster-config config/slurm.json  --cluster config/slurm_scheduler.py  --cluster-status config/slurm_status.py --rerun-incomplete --use-conda
