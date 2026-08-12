# RNA-seq HPC Pipeline

This directory contains the shell scripts used to process raw RNA-seq sequencing data from **GEO accession GSE120862** on a high-performance computing environment.

The workflow converts raw sequencing reads into a gene-level count matrix suitable for downstream differential expression analysis with DESeq2.

## Workflow

**SRA → FASTQ → FastQC → HISAT2 → SAM → sorted BAM → featureCounts → gene count matrix**

The analysis uses a six-sample subset consisting of three paired baseline/post-exercise subjects.

## Pipeline Scripts

### `01_download_reads.sh`

Downloads RNA-seq reads from the NCBI Sequence Read Archive using the SRA Toolkit.

Input: `metadata/subset_runs.txt`

Output: `raw_fastq/*.fastq`

### `02_fastqc.sh`

Runs FastQC on all downloaded FASTQ files to assess sequencing quality.

Quality-control reports are written to `fastqc/`.

FastQC evaluates metrics such as base quality, sequence duplication, GC-content distribution, and potential adapter contamination.

### `03_align_hisat2.sh`

Aligns single-end RNA-seq reads to the human **GRCh38** reference genome using HISAT2.

Input: `raw_fastq/*.fastq`

Reference index: `reference/GRCh38_index`

Output: `alignment/*.sam`

### `04_process_bam.sh`

Processes HISAT2 alignment files with SAMtools.

The script performs:

1. SAM to BAM conversion
2. BAM sorting
3. BAM indexing

Outputs: `alignment/*_sorted.bam` and `alignment/*_sorted.bam.bai`

### `05_featurecounts.sh`

Generates gene-level read counts from sorted BAM files using featureCounts and the GENCODE v44 gene annotation.

Annotation: `reference/gencode.v44.annotation.gtf`

Outputs: `counts/gene_counts.txt` and `counts/gene_counts_clean.txt`

`gene_counts_clean.txt` is the primary input for the downstream DESeq2 analysis.

## Software

The HPC workflow uses:

- SRA Toolkit
- FastQC
- HISAT2
- SAMtools
- Subread / featureCounts
- Linux shell scripting

## Reference Files

The pipeline requires the GRCh38 HISAT2 reference index and GENCODE v44 annotation file.

Large reference genome files are not stored in this repository.

## Sample Metadata

Sample accessions are stored in `metadata/subset_runs.txt`.

The six-sample subset contains three matched baseline/post-exercise pairs.

## Running the Pipeline

Run the scripts sequentially from the project root:

```bash
bash pipeline/01_download_reads.sh
bash pipeline/02_fastqc.sh
bash pipeline/03_align_hisat2.sh
bash pipeline/04_process_bam.sh
bash pipeline/05_featurecounts.sh
```

The final output of the HPC pipeline is `counts/gene_counts_clean.txt`.

This count matrix is then analyzed using the R/DESeq2 workflow in the `Analysis/` directory.

## Computational Environment

The original analysis was performed on the University of Arizona Ocelote HPC system using an interactive allocation with 12 tasks and approximately 72 GB of total requested memory.

The scripts use relative file paths so they can be adapted to other Linux/HPC environments with the required software and reference files installed.
