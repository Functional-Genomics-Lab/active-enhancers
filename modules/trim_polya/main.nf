process TRIM_POLYA {
    input:
    path reads

    output:
    path "*.noPolyA.noAdapt.fastq.gz"

    script:
    """
    trim-polyA.sh -f ${reads}
    """
}
