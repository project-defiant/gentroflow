# Gentroflow

Pipeline to ingest and transform genetic datasets using [gentropy](https://opentargets.github.io/gentropy/)

The goal of this pipeline is to provide a simple way to make the pre-transformations required to run the [gentropy](https://opentargets.github.io/gentropy/) package. The pipeline allows to ingest follwing datasets:

- [FinnGen-UKBB meta analysis](https://finngen.gitbook.io/documentation/methods/meta-analysis#finngen-ukbb-meta-analysis)
- [FinnGen-MVP-UKBB meta analysis](https://finngen.gitbook.io/documentation/methods/meta-analysis#finngen-mvp-ukbb-meta-analysis)

The pipeline is designed to generate the following outputs:

1. [SummaryStatistics](https://opentargets.github.io/gentropy/python_api/datasets/summary_statistics/) - Dataset containing the summary statistics harmonised to the gentropy dataset.
2. [StudyIndex](https://opentargets.github.io/gentropy/python_api/datasets/study_index/) - Dataset containing the study index with the study meta information.
3. [StudyLocus](https://opentargets.github.io/gentropy/python_api/datasets/study_locus/) - 2 datasets containing locus information - (clumped loci and fine-mapped credible sets)

## Installation

### Requirements

- Nextflow
- Docker

## Usage

Pipeline allows to run following workflows:

- `finngen_ukbb` - Ingest and transform the FinnGen-UKBB meta analysis dataset
- `finngen_mvp_ukbb` - Ingest and transform the FinnGen-MVP-UKBB meta analysis dataset

### How does it work?

The pipeline figures out the input dataset based on the `--workflow` parameter. The corresponding workflow gets executed. To see the details of the available workflows check the [workflows](workflow.md)
