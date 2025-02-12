#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --time=20:00:00
#SBATCH --job-name=passassembly
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/genome_assembly/longread_assembly/pass_read/passassembly.out
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/genome_assembly/longread_assembly/pass_read/passassembly.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxbk2@nottingham.ac.uk

# Load environment
source $HOME/.bash_profile

# Activate Unicycler environment
conda activate unicycler

# Define input and output paths
INPUT_FILE="/share/BioinfMSc/rotation1/Group4/long_read/merged_files/pass_merged_barcode04.fastq.gz"
OUTPUT_DIR="/share/BioinfMSc/rotation1/Group4/genome_assembly/longread_assembly/pass_read"

# Run Unicycler                                                                                                         
unicycler -l "$INPUT_FILE" -o "$OUTPUT_DIR" --threads 16 --mode bold                                                    
                                                                                                                        
# Rename key output files for simplicity                                                                                
mv "$OUTPUT_DIR/assembly.fasta" "$OUTPUT_DIR/passassembly.fastq"                                                        
mv "$OUTPUT_DIR/assembly.gfa" "$OUTPUT_DIR/passassembly.gfa"                                                            
                                                                                                                        
# Deactivate conda environment                                                                                          
conda deactivate                                                                                                        
                 
