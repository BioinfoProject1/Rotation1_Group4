#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=10:00:00
#SBATCH --job-name=pilonpolish_b4
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/bandage/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/bandage/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate conda environment
source $HOME/.bashrc
conda activate bandage

# Define file paths
output_dir="/share/BioinfMSc/rotation1/Group4/barcode4_rerun/bandage"
pilonpolish_assembly="/share/BioinfMSc/rotation1/Group4/pilonpolish/polished.fasta"

# Generate bandage image
Bandage image $pilonpolish_assembly $output_dir/pilonpolish_assembly.png

# Deactivate environment
conda deactivate
