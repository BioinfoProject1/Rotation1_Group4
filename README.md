# Rotation1 Group4
## Introduction
This project is derived from Rotation1 of LIFE4136 from the University of Nottingham. 
The project aims to use bioinformatics methods to identify genomic modifications in engineered microbial strains. Researchers generated Illumina short reads and Nanopore long reads for mutant samples and parental controls, but lacked understanding of specific genetic changes. Key issues include determining the number and structure of chromosomes (linear/circular), comparing mutations to controls, evaluating the suitability of long and short reads, and identifying disrupted biological functions.
In this project, our research targets barcode4 and barcode8.

## Installation
A conda environment (named 'myenv' was already created during the environment setup). If not created yet, we can create a new conda environment using the following command:

```bash
conda create -n bioinfo_env python=3.8
conda activate bioinfo_env conda create -n bioinfo_env python=3.8
conda activate bioinfo_env
```
Install required tools using commands:
```bash
conda install -c bioconda unicycler=0.5.0
conda install -c bioconda nanoplot=1.42.0
conda install -c bioconda quast=5.2.0
conda install -c bioconda prokka=1.14.6
conda install -c bioconda minimap2=2.28
conda install bioconda：：bwa
conda install bioconda：：samtools
```
## Data

Data Stages Table

| Stage                        | Input Data                                                                 | Output Data                                                                 |
|------------------------------|---------------------------------------------------------------------------|----------------------------------------------------------------------------|
| **Short Read QC**            | - `*.fastq`                             | - `*fastqc.html`<br>- `fastqc.zip`<br> |
| **Long Read QC**             | - `*.fastq`                             | - `*fastqc.html`<br>- `fastqc.zip`<br> |
| **High-Depth Hybrid Assembly** | - `*fasta.gz`       | - `*.fa` |
| **Low-Depth Hybrid Assembly**  | - `*fasta.gz`       | - `*.fa` |
| **Pass Read Assembly**        | - `*fasta.gz`       | - `*.fa` |
| **Annotation**               | - `*.fa`                   | - `*.fsa`<br>- `*.gff`<br>- `*.ffn `<br>- `*.tsv`<br>- `*.txt`<br>- `*.fna` <br>- `*.faa`<br>- `*.tbl`<br>- `*.sqn` <br>- `*.gbk`|
| **Quast Evaluation**         | - `*.fasta`<br>        | - `*.html`<br>- `*.pdf`<br>- `*.tex`<br>- `*.tsv`<br>- `*.txt` |
| **Prokka Annotation**         | - `*.gbk`<br> - `*.gff`       | - `*.svg`<br>- `*.png`<br>- `*.csv` |
| **BWA Alignment**            | - `*fasta.gz`   | - `*.bam`<br>- `*.sam`<br>- `*.sam.gz `<br>- `*.amb`<br>- `*.ann`<br>- `*.sa` <br>- `*.pac`<br>- `*.bwt` |
| **Minimap**         | - `*fasta.gz`      | - `*.sam`<br>- `*.bam`<br>- `*.fasta` |


This table serves as a guide to understand the data through each stage of the analysis pipeline.

## Code
### 1. Merging files

| Script Name                                      | Description                     |
|--------------------------------------------------|----------------------------------|
| [longreadmerge.sh](/merger/longreadmerge.sh) | Merge long-read FASTQ files    |
| [merger.sh](/merger/merger.sh)   | General long-read merger        |
| [short_read_R1_merger.sh](/merger/short_read_R1_merger.sh) | Merge R1 short-read files       |
| [short_read_R2_merger.sh](/merger/short_read_R2_merger.sh) | Merge R2 short-read files       |

### 2. QC

Using the Nanoplot package

| Script Name                                      | Description                     |
|--------------------------------------------------|----------------------------------|
| [R1_qc.sh](/merger/R1_qc.sh)     | R1 short-read QC                |
| [R2_qc.sh](/merger/R2_qc.sh)     | R2 short-read QC                |
| [passmerger.sh](/merger/passmerger.sh) | Merge QC-passed long-read files |
| [failmerger.sh](/merger/failmerger.sh) | Merge QC-failed long-read files |

### 3. Genome assembly

Using the Unicylcer package

| Script Name                  | Description                              |
|------------------------------|------------------------------------------|
| [highdepth_hybrid_assembly.sh](/barcode8/assembly/highdepth_hybrid_assembly.sh) | High-depth hybrid assembly script        |
| [lowdepth_hybrid_assembly.sh](/barcode8/assembly/lowdepth_hybrid_assembly.sh)  | Low-depth hybrid assembly script         |
| [pass_longread_assembly.sh](/barcode8/assembly/pass_longread_assembly.sh)    | Assemble passing long-reads post-QC      |
| [pf_longread_assembly.sh](/barcode8/assembly/pf_longread_assembly.sh)      | Assemble partially filtered long-reads   |
| [shortread_assembly.sh](/barcode8/assembly/shortread_assembly.sh)        | Short-read assembly script               |

### 4. Quast

Using the Quast package

| Script Name                                      | Description                     |
|--------------------------------------------------|----------------------------------|
| [quast.sh](/barcode8/quast.sh)     | combined quast                |
| [compare_assemblies_mergep4ref.sh](/barcode8/compare_assemblies_mergep4ref.sh )     | compare assembly methods   |
| [longread_quast.sh](/barcode8/longread_quast.sh)     |longread_eval                 |
| [shortread_quast.sh](/barcode8/shortread_quast.sh) | shortread_eval |
| [hybrid_quast.sh](/barcode8/hybrid_quast.sh) | hybrid_eval |

### 5. Genome annotation

Using the Prokka package

| Script Name                                      | Description                     |
|--------------------------------------------------|----------------------------------|
| [compliant_hybrid_prokka.sh](/barcode8/compliant_hybrid_prokka.sh)     |  compliant hybrid               |
| [highdepth_hybrid_prokka.sh](/barcode8/highdepth_hybrid_prokka.sh)     |  highdepth hybrid               |
| [lowdepth_hybrid_prokka.sh](/barcode8/lowdepth_hybrid_prokka.sh)     | lowdepth hybrid   |
| [prokka_pass_longreads.sh](/barcode8/prokka_pass_longreads.sh)     |pass longreads        |
| [prokka.sh](/barcode8/prokka.sh) | short reads |

Annotating references

| Script Name                                      | Description                     |
|--------------------------------------------------|----------------------------------|
| [merge_ref.sh](/barcode8/merge_ref.sh)     |  merge the references               |
| [merge_ann_ref.sh](/barcode8/merge_ann_ref.sh)     |     annotationg the merge references           |

Using genovi package

[complete_highdepth_hybrid_genovi.sh](/barcode8/complete_highdepth_hybrid_genovi.sh)


### 6. IGV

Using this website to download IGV (https://igv.org/doc/desktop/#DownloadPage/)

Using the bwa package

Using the samtools package

| Script Name                                      | Description                     |
|--------------------------------------------------|----------------------------------|
| [bam_bai_maker.sh](/barcode8/bam_bai_maker.sh)     |  creating sorted shortread .BAM.bai file              |
| [p4inc_bam_bai_maker.sh](/barcode8/p4inc_bam_bai_maker.sh)     | Creating shortread .BAM.bai file              |
| [filter_end.sh](/barcode8/filter_end.sh)     | Filter for end region            |

| Script Name                                      | Description                     |
|--------------------------------------------------|----------------------------------|
| [bam_bai_converter.sh](/barcode8/bam_bai_converter.sh)     |  creating sorted longread .BAM.bai file              |
| [p4inc_bam_bai_converter.sh](/barcode8/p4inc_bam_bai_converter.sh)     | Creating longread .BAM.bai file              |


## References
[1] Unicycler 
https://github.com/rrwick/Unicycler 
<br>[2] Quast 
https://quast.sourceforge.net/docs/manual.html
<br>[3] 
Prokka https://github.com/tseemann/prokka
<br>[4] 
https://github.com/robotoD/GenoVi?tab=readme-ov-file



