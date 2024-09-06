process TRIM_ADAPTER_SEQUENCE {
    conda "cutadapt=1.8.1"

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
