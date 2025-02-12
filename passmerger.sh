#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=5g
#SBATCH --time=00:50:00
#SBATCH --job-name=pass_merger
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/long_read-nanoplot/passmerger-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/long_read-nanoplot/passmerger-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# Activate conda environment
conda activate nanoplot

# Merge pass files
cat /share/BioinfMSc/Matt_resources/long_reads/fastq_pass/barcode04/*.fastq.gz > /share/BioinfMSc/rotation1/Group4/long_read-nanoplot/pass_merged_barcode04.fastq.gz

# Nanoplot
NanoPlot --fastq pass_merged_barcode04.fastq.gz > /share/BioinfMSc/rotation1/Group4/long_read-nanoplot/passnanoplot_results/ 

# Deactivate conda environment                                                                                          
conda deactivate   
