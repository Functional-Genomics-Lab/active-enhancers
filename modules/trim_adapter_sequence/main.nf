process TRIM_ADAPTER_SEQUENCE {
    input:
    tuple val(meta), path(reads)

    output:
    path "*.noAdapt.fastq.gz"

    script:
    """
    trim-adapter.sh \\
        -f ${reads} \\
        -a TCGTATCCCGTCTTCTGCTTG
    """
}
