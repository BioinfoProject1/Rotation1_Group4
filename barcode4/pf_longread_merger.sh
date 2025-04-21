#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=5g
#SBATCH --time=00:50:00
#SBATCH --job-name=pf_merger
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/longread/%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/longread/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate conda environment
source $HOME/.bash_profile
conda activate nanoplot

# Paths
fastq=/share/BioinfMSc/rotation1/Group4/barcode4_rerun/longread

# Merge pass files
cat $fastq/fail_merged_barcode04.fastq.gz $fastq/pass_merged_barcode04.fastq.gz > /share/BioinfMSc/rotation1/Group4/barcode4_rerun/longread/pf_merg$
# Nanoplot
NanoPlot --fastq $fastq/pf_merged_barcode04.fastq.gz -o $fastq/pfnanoplot_results

# Deactivate conda environment
conda deactivate
