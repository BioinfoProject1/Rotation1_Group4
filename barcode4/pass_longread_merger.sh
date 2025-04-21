#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=5g
#SBATCH --time=00:50:00
#SBATCH --job-name=pass_merger
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/longread/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/longread/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate conda environment
source $HOME/.bash_profile
conda activate nanoplot

# path
outdir=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/longread

# Merge pass files
cat /share/BioinfMSc/Matt_resources/long_reads/fastq_pass/barcode04/*.fastq.gz > $outdir/pass_merged_barcode04.fastq.gz

# Nanoplot
NanoPlot --fastq $outdir/pass_merged_barcode04.fastq.gz -o $outdir/passnanoplot_results

# Deactivate conda environment
conda deactivate
