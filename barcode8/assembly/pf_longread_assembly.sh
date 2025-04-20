#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100g
#SBATCH --time=00:50:00
#SBATCH --job-name=pf_assembly
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pf_read/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pf_read/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk


# source your bash profile to use conda
source $HOME/.bash_profile

# Activate conda environment
conda activate unicycler2

# Define input and output paths
pf_longreads=/share/BioinfMSc/rotation1/Group4/barcode8/long_read/pf_merged_barcode08.fastq.gz
OUTPUT_DIR=/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pf_read

# Run Unicycler
unicycler -l "$pf_longreads" -o "$OUTPUT_DIR" --threads 16 --mode bold

# Deactivate conda environment
conda deactivate
