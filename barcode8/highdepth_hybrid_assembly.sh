#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --time=23:00:00
#SBATCH --job-name=highdepth_hybrid
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/highdepth_hybrid/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/highdepth_hybrid/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Load environment
source $HOME/.bash_profile

# Activate unicycler environment
conda activate unicycler2

# Define input and NEW output paths
R1="/share/BioinfMSc/rotation1/Group4/barcode8/short_read/R1merged_08.fastq"
R2="/share/BioinfMSc/rotation1/Group4/barcode8/short_read/R2merged_08.fastq"
