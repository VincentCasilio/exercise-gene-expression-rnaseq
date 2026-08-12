#!/bin/bash
set -euo pipefail

# Generate gene-level counts from sorted BAM files using featureCounts

module load subread

mkdir -p counts

featureCounts \
    -T 12 \
    -a reference/gencode.v44.annotation.gtf \
    -o counts/gene_counts.txt \
    alignment/*_sorted.bam

# Keep Geneid plus sample count columns for downstream DESeq2 analysis
cut -f1,7- counts/gene_counts.txt \
    > counts/gene_counts_clean.txt
