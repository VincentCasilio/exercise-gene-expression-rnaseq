#!/bin/bash
set -euo pipefail

# Convert HISAT2 SAM output to sorted and indexed BAM files

module load samtools

for file in alignment/*.sam
do
    base=$(basename "$file" .sam)

    samtools view \
        -bS "$file" \
        -o "alignment/${base}.bam"

    samtools sort \
        "alignment/${base}.bam" \
        -o "alignment/${base}_sorted.bam"

    samtools index \
        "alignment/${base}_sorted.bam"
done
