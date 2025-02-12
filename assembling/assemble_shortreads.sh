#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --time=23:00:00
#SBATCH --job-name=assemble_shortreads
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/genome_assembly/shortread_assembly/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/genome_assembly/shortread_assembly/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk


# Load environment
source $HOME/.bash_profile

# Define files and directories
R1=/share/BioinfMSc/rotation1/Group4/short_read/R1_shortreads.fastq.gz
R2=/share/BioinfMSc/rotation1/Group4/short_read/R2_shortreads.fastq.gz
DEST_DIR=/share/BioinfMSc/rotation1/Group4/genome_assembly/shortread_assembly

# Activate Unicycler environment
conda activate unicycler

# Run genome assembly using Unicycler                                                                                   
unicycler -1 $R1 -2 $R2 -o $DEST_DIR --threads 16 --mode bold                                                           
                                                                                                                        
# Deactivate conda environment                                                                                          
conda deactivate
