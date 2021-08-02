#!/bin/bash
source activate stripes
snakemake --keep-going -j 20 -s ./tiger.snek --configfile config/config_diprotodon_all_samples_F7.yaml  --rerun-incomplete

snakemake --keep-going -j 20 -s ./tiger.snek --configfile config/config_diprotodon_all_samples_F9.yaml  --rerun-incomplete

snakemake --keep-going -j 20 -s ./tiger.snek --configfile config/config_diprotodon_all_samples_F10.yaml  --rerun-incomplete

snakemake --keep-going -j 20 -s ./tiger.snek --configfile config/config_diprotodon_all_samples_F11.yaml  --rerun-incomplete

snakemake --keep-going -j 20 -s ./tiger.snek --configfile config/config_diprotodon_all_samples_F13.yaml  --rerun-incomplete

snakemake --keep-going -j 20 -s ./tiger.snek --configfile config/config_diprotodon_all_samples_F14.yaml  --rerun-incomplete
