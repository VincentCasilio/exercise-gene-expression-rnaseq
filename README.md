# Exercise-Induced Gene Expression Analysis Using RNA-seq

## Project Overview

This project investigates how aerobic exercise influences human gene expression using publicly available RNA-seq data from the Gene Expression Omnibus (GEO) dataset **GSE120862**.

The primary research question was:

> How does regular exercise influence human gene expression in ways that may support cognitive function, learning, and memory?

This project was completed as part of a Bioinformatics undergraduate program and demonstrates a complete RNA-seq analysis workflow, from raw sequencing data to biological interpretation.

---

## Dataset

**Source:** GEO Accession GSE120862

The dataset contains human samples collected before and after an exercise intervention. RNA sequencing was used to measure gene expression changes associated with exercise.

---

## Bioinformatics Workflow

### 1. Sequence Data Acquisition

Raw sequencing data were downloaded from the NCBI Sequence Read Archive (SRA) using the SRA Toolkit.

### 2. Quality Control

Sequence quality was evaluated using **FastQC** to identify potential issues such as low-quality reads, adapter contamination, and sequence duplication.

### 3. Alignment

Reads were aligned to the human reference genome (**GRCh38**) using **HISAT2**.

### 4. Gene Quantification

Aligned reads were assigned to genes using **featureCounts** with GENCODE gene annotations.

### 5. Differential Expression Analysis

Gene count data were analyzed in **R** using **DESeq2** to identify genes whose expression changed significantly following exercise.

### 6. Biological Interpretation

Significant genes were evaluated using Gene Ontology resources to identify biological processes associated with exercise-induced transcriptional changes.

---

## Software and Tools

| Tool | Purpose |
|--------|---------|
| SRA Toolkit | Download sequencing data |
| FastQC | Sequence quality assessment |
| HISAT2 | Read alignment |
| featureCounts | Gene quantification |
| R | Statistical analysis |
| DESeq2 | Differential expression analysis |
| Gene Ontology | Functional interpretation |

---

## Computational Environment

Analysis was performed on the University of Arizona High Performance Computing (HPC) system using Linux command-line tools.

Reference files:

- Human Genome: GRCh38
- Annotation: GENCODE v44

---

## Key Findings

The analysis identified significant changes in gene expression following exercise.

Major observations included:

- Differential expression of genes involved in energy metabolism.
- Increased expression of genes associated with mitochondrial function.
- Upregulation of **PPARGC1A**, a key regulator of mitochondrial biogenesis and exercise adaptation.
- Evidence supporting the role of exercise in regulating biological pathways linked to cellular energy production and physiological adaptation.

---

## Example Results

### Principal Component Analysis (PCA)

The PCA plot demonstrates separation between baseline and post-exercise samples, indicating distinct transcriptional profiles.

![PCA Plot](figures/pca_plot.png)

---

### Volcano Plot

The volcano plot highlights significantly differentially expressed genes following exercise.

![Volcano Plot](figures/volcano_plot.png)

---

## Repository Structure

```text
exercise-gene-expression-rnaseq/

├── README.md
├── data/
├── scripts/
├── figures/
├── results/
└── report/
```

---

## Skills Demonstrated

- Bioinformatics
- RNA-seq Analysis
- Linux Command Line
- High Performance Computing (HPC)
- R Programming
- Statistical Analysis
- Differential Gene Expression
- Data Visualization
- Reproducible Research

---

## Future Directions

Potential extensions of this work include:

- Pathway enrichment analysis
- Weighted Gene Co-expression Network Analysis (WGCNA)
- Integration with cognitive performance datasets
- Comparison of exercise intensity and duration effects on gene expression

---

## Author

**Vinny Casilio**

B.S. Bioinformatics Candidate  
University of Arizona

LinkedIn: www.linkedin.com/in/vincentcasilio

---

## License

This project is licensed under the MIT License.
