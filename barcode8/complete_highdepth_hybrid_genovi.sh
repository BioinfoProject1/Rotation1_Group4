#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=23:00:00
#SBATCH --job-name=complete_genovi_highdepth_hybrid
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/interpretation/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/interpretation/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Source environments
source $HOME/.bash_profile

# Load conda environment
conda activate genovi

# Gbk data
highdepth_scaffold_hybrid=/share/BioinfMSc/rotation1/Group4/barcode8/genome_annotation/highdepth_hybrid/compliant_prokka/hvolcanii_DS2_highdepth_ge$
# Run genovi
genovi -i $highdepth_scaffold_hybrid -cs strong -s complete --size

# Deactivate environment
conda deactivate
