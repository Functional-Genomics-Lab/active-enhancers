process TRIM_POLYA {
    conda "cutadapt=1.8.1"

    input:
    path reads

    output:
    path "*.noPolyA.noAdapt.fastq.gz"

    script:
    """
    trim-polyA.sh -f ${reads}
    """
}
