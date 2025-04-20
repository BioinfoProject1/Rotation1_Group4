#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50G
#SBATCH --time=06:00:00
#SBATCH --job-name=quast_shortreads
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/quast/shortread_eval/quast_analysis.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/quast/shortread_eval/quast_analysis.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxbk2@nottingham.ac.uk

source ~/.bashrc
conda activate quast

# Define input paths
ASSEMBLY="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/short_reads/assembly.fasta"
R1_READS="/share/BioinfMSc/rotation1/Group4/barcode8/short_read/R1merged_08.fastq"
R2_READS="/share/BioinfMSc/rotation1/Group4/barcode8/short_read/R2merged_08.fastq"
REFERENCE="/share/BioinfMSc/rotation1/Group4/barcode8/quast/shortread_eval/reference.fasta"
GENES="/share/BioinfMSc/rotation1/Group4/barcode8/quast/shortread_eval/genes.txt"

# Define output directory
OUTPUT_DIR="/share/BioinfMSc/rotation1/Group4/barcode8/quast/shortread_eval/quast_output"

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Run QUAST
quast.py $ASSEMBLY \
    -r $REFERENCE \
    -g $GENES \
    --pe1 $R1_READS \
    --pe2 $R2_READS \
    -o $OUTPUT_DIR \
    --threads 8
