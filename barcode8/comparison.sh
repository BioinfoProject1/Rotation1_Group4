#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=06:00:00
#SBATCH --job-name=prokka_hybridhigh
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/genome_annotation/hybrid/high_depth/prokka_hybridhigh.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/genome_annotation/hybrid/high_depth/prokka_hybridhigh.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxbk2@nottingham.ac.uk

source $HOME/.bash_profile

# Paths
REFERENCE_DIR="/share/BioinfMSc/rotation1/Group4/barcode8/quast/shortread_eval"
ASSEMBLY_DIR="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/short_reads"
OUTPUT_DIR="/share/BioinfMSc/rotation1/Group4/barcode8/interpretation"

# Input files
REFERENCE_FASTA="$REFERENCE_DIR/reference.fasta"
SCAFFOLDS_FASTA="$ASSEMBLY_DIR/scaffolds.fasta"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Step 1: Create comparison for scaffolds
conda activate mummer
nucmer --prefix="$OUTPUT_DIR/reference_vs_scaffolds" "$REFERENCE_FASTA" "$SCAFFOLDS_FASTA"


# Step 2: Filter delta file for scaffolds
delta-filter -q "$OUTPUT_DIR/reference_vs_scaffolds.delta" > "$OUTPUT_DIR/reference_vs_scaffolds.filtered.delta"

# Step 3: Generate coords for scaffolds
show-coords -rcl "$OUTPUT_DIR/reference_vs_scaffolds.filtered.delta" > "$OUTPUT_DIR/reference_vs_scaffolds.coords"

conda deactivate
