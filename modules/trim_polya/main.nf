process TRIM_POLYA {
    conda "cutadapt'<2.0'"

    input:
    path reads

    output:
    path "*.noPolyA.noAdapt.fastq.gz"

    script:
    """
    trim-polyA.sh -f ${reads}
    """
}
