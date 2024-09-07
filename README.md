# active-enhancers

Identifying active enhancers and well known transcription factor binding sites from GRO-seq data.

This a fork of [Kraus-Lab/active-enhancers](https://github.com/Kraus-Lab/active-enhancers), rewritten to use Nextflow to streamline the use.

## Running

[Install Nextflow](https://www.nextflow.io/) and [Docker](https://docs.docker.com/engine/install/)

```sh
nextflow run Functional-Genomics-Lab/active-enhancers -profile utd_ganymede
```

## Results

[Results of the reproduction can be viewed on Hugging Face](https://huggingface.co/datasets/funlab/active-enhancers)

<iframe
  src="https://huggingface.co/datasets/funlab/active-enhancers/embed/viewer/default/train"
  frameborder="0"
  width="100%"
  height="560px"
></iframe>

## Original Authors

- [Anusha Nagari](https://github.com/anaga2)
- [Venkat Malladi](https://github.com/vsmalladi)

### Included tools and software

These are all built and installed via [Wave containers](https://seqera.io/wave/)

- [R 3.0.2](www.r-project.org/)
- [Python 2.7.2](https://www.python.org/)
- [Perl v5.18.2](https://www.perl.org)
- [fastqc 0.10.1](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- [cutadapt 1.2.1](http://cutadapt.readthedocs.org/en/stable/index.html)
- [BWA 0.7.12](http://bio-bwa.sourceforge.net)
- [samtools 0.1.19](http://samtools.sourceforge.net/)
- [bedtools 2.17.0](http://bedtools.readthedocs.org/en/latest/)
- [groHMM](http://www.bioconductor.org/packages/release/bioc/html/groHMM.html)
- [SRA Tools 2.5.4](https://github.com/ncbi/sra-tools)

## Data

Data for the tutorial is downloaded from [GSE43835](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE43835).

This experiment looks at GRO-seq data from MCF-7 human breast cancer cells in response to short time course of E2 treatment (10min, 40min) and no treatment (Vehicle).
