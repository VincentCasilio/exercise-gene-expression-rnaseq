#!/bin/bash
set -euo pipefail

# Run FastQC on all RNA-seq FASTQ files

module load fastqc

mkdir -p fastqc

fastqc raw_fastq/*.fastq \
    -o fastqc
