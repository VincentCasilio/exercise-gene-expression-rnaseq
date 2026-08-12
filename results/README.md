# RNA-seq Analysis Results

This directory contains the primary outputs from the differential gene expression analysis of human skeletal muscle samples before and after aerobic exercise.

## Summary

Differential expression analysis was performed using DESeq2 with a paired experimental design accounting for subject-level variation.

- 22,770 genes analyzed after low-count filtering
- 480 significantly differentially expressed genes (adjusted p-value < 0.05)
- 349 significantly upregulated genes
- 131 significantly downregulated genes

## Files

### `differential_expression_results.csv`

Complete DESeq2 results for all genes included in the analysis, including gene annotation, normalized expression statistics, log2 fold change, p-values, and adjusted p-values.

### `significant_genes.csv`

Subset of genes meeting the significance threshold:

`adjusted p-value < 0.05`

### `top_upregulated_genes.csv`

Top annotated significantly upregulated genes ranked by log2 fold change.

### `top_downregulated_genes.csv`

Top annotated significantly downregulated genes ranked by log2 fold change.

## Figures

### PCA

![PCA Plot](pca_plot.png)

Principal component analysis of variance-stabilized expression data. Samples are grouped by subject and exercise time point to visualize overall expression patterns and subject-level variation.

### Volcano Plot

![Volcano Plot](volcano_plot.png)

Volcano plot showing genome-wide differential expression following exercise. Genes meeting the adjusted p-value threshold of 0.05 are highlighted.

## Analysis

These results were generated from the RNA-seq workflow contained in the `Analysis/` directory.

The analysis includes count filtering, paired DESeq2 modeling, differential expression testing, gene annotation, PCA, and visualization.
