#!/bin/bash
set -euo pipefail

# Align single-end RNA-seq reads to the human GRCh38 reference genome

module load hisat2
module load samtools

mkdir -p alignment

for file in raw_fastq/*.fastq
do
    base=$(basename "$file" .fastq)

    hisat2 \
        -x reference/GRCh38_index \
        -U "$file" \
        -S "alignment/${base}.sam"
done
