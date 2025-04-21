#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --time=23:00:00
#SBATCH --job-name=p4_bambai
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode8/minimap/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode8/minimap/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate samtools environment
source $HOME/.bash_profile
conda activate samtools

samfile=/share/BioinfMSc/rotation1/Group4/barcode8/minimap/minimap2/p4incref_plongread_aln.sam
output_dir=/share/BioinfMSc/rotation1/Group4/barcode8/minimap

# Sort sam file and output bam file
samtools view -bS $samfile | samtools sort -o p4incref_plongread.bam

# Index bam file
samtools index $output_dir/p4incref_plongread.bam p4incref_plongread.bai

# Deactivate conda environment
conda deactivate
