#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=23:00:00
#SBATCH --job-name=index_bam
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/minimap/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/minimap/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate samtools environment
source $HOME/.bash_profile
conda activate samtools

samfile=/share/BioinfMSc/rotation1/Group4/barcode8/minimap/minimap2/plongread_mergedref_alignment.sam
output_dir=/share/BioinfMSc/rotation1/Group4/barcode8/minimap

# Sort sam file and output bam file
samtools view -bS $samfile | samtools sort -o sorted_plongread_mergref.bam

# Index bam file
samtools index $output_dir/sorted_plongread_mergref.bam sorted_plongread_mergref.bai

# Deactivate conda environment
conda deactivate
