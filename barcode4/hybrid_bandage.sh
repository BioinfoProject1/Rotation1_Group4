#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=10:00:00
#SBATCH --job-name=hybrid_bandage_b4
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/bandage/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/bandage/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate conda environment
source $HOME/.bashrc
conda activate bandage

# Define file paths
output_dir="/share/BioinfMSc/rotation1/Group4/barcode4_rerun/bandage"
highdepth_assembly="/share/BioinfMSc/rotation1/Group4/barcode4_rerun/genome_assembly/unicycler/highdepth_hybrid/assembly.gfa"

# Generate bandage image
Bandage image $highdepth_assembly $output_dir/highdepth_assembly.png

# Deactivate environment
conda deactivate
