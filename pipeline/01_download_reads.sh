#!/bin/bash
set -euo pipefail

# Download RNA-seq reads from NCBI SRA
# Dataset: GSE120862

module load sratoolkit/3.1.1

mkdir -p raw_fastq

while read RUN
do
    fasterq-dump "$RUN" \
        --threads 12 \
        --outdir raw_fastq
done < metadata/subset_runs.txt
