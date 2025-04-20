# Rotation1 Group4
## Introduction
This project is about LIFE4136 being carried out in Group4 of Rotation1. This research project is about the strain of a microorganism. We need to study which places or parts of the genome have been modified and where what changes have occurred. Our data includes short-read (Illumina data) and long-read data for some samples, but the majority of the samples only have long-read data. We want a collection of these genomes to determine what has happened to them.
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
conda install bioconda：：amr
conda install bioconda：：bwa
conda install bioconda：：samtools
```
## Data

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

### 3. Assemblies

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

### 6. IGV
Using this website to download IGV (https://igv.org/doc/desktop/#DownloadPage/)


## References
