#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --time=23:00:00
#SBATCH --job-name=eval_shortreads
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/quast/short_read_eval/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/quast/short_read_eval/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk


# Load environment
source $HOME/.bash_profile

# Define files and directories
aligned=/share/BioinfMSc/rotation1/Group4/genome_assembly/shortread_assembly/assembly.fasta
R1=/share/BioinfMSc/rotation1/Group4/short_read/R1_shortreads.fastq.gz
R2=/share/BioinfMSc/rotation1/Group4/short_read/R2_shortreads.fastq.gz
REFERENCE=/share/BioinfMSc/rotation1/Group4/quast/long_read_eval/reference.fasta.gz
GENES=/share/BioinfMSc/rotation1/Group4/quast/long_read_eval/genes.txt
DEST_DIR=/share/BioinfMSc/rotation1/Group4/quast/short_read_eval/quast_test_output

# Activate quast environment                                                                                            
conda activate quast                                                                                                    
                                                                                                                        
# Evaluate genome using quast                                                                                           
quast.py $aligned\                                                                                                      
        -r $REFERENCE\                                                                                                  
        -1 $R1 -2 $R2\                                                                                                  
        -g $GENES\                                                                                                      
        -o $DEST_DIR   

# Deactivate conda environment                                                                                          
conda deactivate 
