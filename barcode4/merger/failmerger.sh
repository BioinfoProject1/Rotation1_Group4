#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=5g
#SBATCH --time=00:10:00
#SBATCH --job-name=failmerger
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/long_read-nanoplot/failerror-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/long_read-nanoplot/failerror-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=alyzx23@exmail.nottingham.ac.uk

# source your bash profile so you can use conda
source $HOME/.bash_profile

# create a conda environment
conda activate nanoplot

cat /share/BioinfMSc/Matt_resources/long_reads/fastq_fail/barcode04/*.fastq.gz > /share/BioinfMSc/rotation1/Group4/long_read-nanoplot/failed_merged_barcode04.fastq.gz

#nanoplot
NanoPlot --fastq failed_merged_barcode04.fastq.gz > /share/BioinfMSc/rotation1/Group4/long_read-nanoplot/failednanoplot_results/

conda deactivate 
