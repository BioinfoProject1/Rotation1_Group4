#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=08:00:00
#SBATCH --job-name=quast_combined
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/quast/combined_quast/quast_combined.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/quast/combined_quast/quast_combined.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxbk2@nottingham.ac.uk

source ~/.bashrc
conda activate quast

# Define input paths for assemblies
highdepth_assembly="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/highdepth_hybrid/highdepth_assembly.fasta"
lowdepth_assembly="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/lowdepth_hybrid/lowdepth_assembly.fasta"
passffail_assembly="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pf_read/pf_assembly.fasta"
pass_assembly="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/pass_read/pass_assembly.fasta"
shortread_assembly="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/short_reads/scaffolds.fasta"

R1_READS="/share/BioinfMSc/rotation1/Group4/barcode8/short_read/R1merged_08.fastq"
R2_READS="/share/BioinfMSc/rotation1/Group4/barcode8/short_read/R2merged_08.fastq"

# Define reference and genes files
REFERENCE="/share/BioinfMSc/rotation1/Group4/barcode8/quast/shortread_eval/reference.fasta"
GENES="/share/BioinfMSc/rotation1/Group4/barcode8/quast/shortread_eval/genes.txt"

# Define output directory
OUTPUT_DIR="/share/BioinfMSc/rotation1/Group4/barcode8/quast/combined_quast"

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Run QUAST
quast.py $highdepth_assembly $lowdepth_assembly $passffail_assembly $pass_assembly $shortread_assembly \
    -r $REFERENCE \
    -g $GENES \
    --pe1 $R1_READS \
    --pe2 $R2_READS \
    -o $OUTPUT_DIR \
    --threads 8

conda deactivate
