#!/bin/bash
source activate stripes
snakemake --keep-going -j 20 -s ./tiger.snek --configfile config/config_diprotodon_all_samples_F4.yaml  --rerun-incomplete

snakemake --keep-going -j 20 -s ./tiger.snek --configfile config/config_diprotodon_all_samples_F5.yaml  --rerun-incomplete

snakemake --keep-going -j 20 -s ./tiger.snek --configfile config/config_diprotodon_all_samples_F6.yaml  --rerun-incomplete
