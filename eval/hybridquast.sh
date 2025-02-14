#!/bin/bash                                                                                                             
                                                                                                                        
#SBATCH --partition=defq                                                                                                
#SBATCH --nodes=1                                                                                                       
#SBATCH --ntasks=1                                                                                                      
#SBATCH --cpus-per-task=16                                                                                              
#SBATCH --mem=100G                                                                                                      
#SBATCH --time=10:00:00                                                                                                 
#SBATCH --job-name=hybridquast                                                                                          
#SBATCH --output=/share/BioinfMSc/rotation1/Group4/quast/hybrid_eval/quast_analysis.out                                 
#SBATCH --error=/share/BioinfMSc/rotation1/Group4/quast/hybrid_eval/quast_analysis.err                                  
#SBATCH --mail-type=ALL                                                                                                 
#SBATCH --mail-user=mbxbk2@nottingham.ac.uk                                                                             
                                                                                                                        
# Load environment                                                                                                      
source $HOME/.bash_profile                                                                                              
                                                                                                                        
# Activate QUAST environment                                                                                            
conda activate quast                                                                                                    
                                                                                                                        
# Define correct input and output paths                                                                                 
ASSEMBLY1="/share/BioinfMSc/rotation1/Group4/genome_assembly/hybrid_assembly/hybrid_high_depth_assembly/spades_assembly$ASSEMBLY2="/share/BioinfMSc/rotation1/Group4/genome_assembly/hybrid_assembly/hybrid_low_depth_assembly/assembly.fasta"  
REFERENCE="/share/BioinfMSc/rotation1/Group4/quast/long_read_eval/reference.fasta.gz"                                   
GENES="/share/BioinfMSc/rotation1/Group4/quast/long_read_eval/genes.txt"
OUTPUT_DIR="/share/BioinfMSc/rotation1/Group4/quast/hybrid_eval/quast_results"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Run QUAST
quast.py "$ASSEMBLY1" "$ASSEMBLY2" \
  -r "$REFERENCE" -g "$GENES" \
  -o "$OUTPUT_DIR" --threads 16

# Deactivate Conda environment
conda deactivate
