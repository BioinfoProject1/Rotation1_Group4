#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=80g
#SBATCH --time=20:00:00
#SBATCH --job-name=hybrid_quast
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/quast/hybrid_eval/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/quast/hybrid_eval/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Load environment
source $HOME/.bash_profile

# Activate QUAST environment
conda activate quast

# Make output directory if it does not already exist
mkdir -p quast

# Define assembly variables
highdepth_assembly="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/highdepth_hybrid/highdepth_assembly.fasta"
lowdepth_assembly="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/lowdepth_hybrid/lowdepth_assembly.fasta"
reference="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pass_read/hvolcanii_ref.fasta"
genes="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pass_read/genes.txt"
output_dir="/share/BioinfMSc/rotation1/Group4/barcode8/quast/hybrid_eval/quast"

# Run quast
quast.py $highdepth_assembly $lowdepth_assembly \
    -r $reference \
    -g $genes \
    -o $output_dir \
    --threads 16

# Deactivate conda environment
