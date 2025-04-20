#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=02:00:00
#SBATCH --job-name=bandage_shortreads
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/quast/shortread_eval/bandage.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/quast/shortread_eval/bandage.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxbk2@nottingham.ac.uk

source ~/.bashrc
conda activate bandage


GRAPH_FILE="/share/BioinfMSc/rotation1/Group4/barcode8/genome_assembly/short_reads/assembly.gfa"

# Define output visualization image
OUTPUT_IMAGE="/share/BioinfMSc/rotation1/Group4/barcode8/quast/shortread_eval/shortreads_graph.png"

# Run Bandage to visualize the assembly graph
Bandage image $GRAPH_FILE $OUTPUT_IMAGE --height 1000 --width 1000
