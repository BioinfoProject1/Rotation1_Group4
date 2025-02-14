# Load environment                                                                                                      
source $HOME/.bash_profile                                                                                              
                                                                                                                        
# Activate QUAST environment                                                                                            
conda activate quast                                                                                                    
                                                                                                                        
# Define input paths                                                                                                    
MERGED_SHORT_READS="/share/BioinfMSc/rotation1/Group4/genome_assembly/shortread_assembly/assembly.fasta"                
LONG_READ_ASSEMBLY="/share/BioinfMSc/rotation1/Group4/genome_assembly/longread_assembly/pass_read/passassembly.fasta"   
HYBRID_HIGH_DEPTH_ASSEMBLY="/share/BioinfMSc/rotation1/Group4/genome_assembly/hybrid_assembly/hybrid_high_depth_assembly/spades_assembly/contigs.fasta" 
HYBRID_LOW_DEPTH_ASSEMBLY="/share/BioinfMSc/rotation1/Group4/genome_assembly/hybrid_assembly/hybrid_low_depth_assembly/assembly.fasta" 

REFERENCE="/share/BioinfMSc/rotation1/Group4/quast/long_read_eval/reference.fasta.gz"                                   
GENES="/share/BioinfMSc/rotation1/Group4/quast/long_read_eval/genes.txt"                                                
OUTPUT_DIR="/share/BioinfMSc/rotation1/Group4/quast/combinedquast_results"                                              
                                                                                                                        
# Create output directory if it doesn't exist                                                                           
mkdir -p "$OUTPUT_DIR"                                                                                                  
                                                                                                                        
# Run QUAST using renamed labels for the report                                                                         
quast.py \                                                                                                              
  --labels "Short Reads","Long Reads","Hybrid High Depth","Hybrid Low Depth" \                                          
  "$MERGED_SHORT_READS" "$LONG_READ_ASSEMBLY" "$HYBRID_HIGH_DEPTH_ASSEMBLY" "$HYBRID_LOW_DEPTH_ASSEMBLY" \ -r "$REFERENCE" -g "$GENES" \ -r "$REFERENCE" -g "$GENES" \ -o "$OUTPUT_DIR" --threads 16                                                                                         
                                                                                                                        
# Deactivate Conda environment                                                                                          
conda deactivate   
