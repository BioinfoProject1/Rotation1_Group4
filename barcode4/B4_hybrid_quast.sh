#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20g
#SBATCH --time=20:00:00
#SBATCH --job-name=hybrid_quast
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/quast/b4/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/quast/b4/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate environment
source $HOME/.bash_profile
conda activate quast

# Define assembly variables
b4_hybrid="/share/BioinfMSc/rotation1/Group4/barcode4_rerun/genome_assembly/unicycler/highdepth_hybrid/assembly.fasta"
b4_pilon="/share/BioinfMSc/rotation1/Group4/pilonpolish/polished.fasta"
reference="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pass_read/hvolcanii_ref.fasta"
genes="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pass_read/genes.txt"
output_dir="/share/BioinfMSc/rotation1/Group4/barcode4_rerun/quast/b4"

# Run quast
quast.py $b4_hybrid $b4_pilon \
    -r $reference \
    -g $genes \
    -o $output_dir \
    --threads 16

# Deactivate conda environment
conda deactivate
