#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --time=10:00:00
#SBATCH --job-name=longreadquast
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/quast/longread_eval/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/quast/longread_eval/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Load environment
source $HOME/.bash_profile

# Activate quast environment
conda activate quast

# Define correct input and output paths
pf_assembly="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pf_read/pf_assembly.fasta"
pass_assembly="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pass_read/pass_assembly.fasta"
reference="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pass_read/hvolcanii_ref.fasta"
genes="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pass_read/genes.txt"
output_dir="/share/BioinfMSc/rotation1/Group4/barcode8/quast/longread_eval/quast_results"

# Run quast
quast.py $pf_assembly $pass_assembly \
  -r $reference -g $genes \
  -o $output_dir --threads 16

# Deactivate conda environment
conda deactivate
