process TRIM_ADAPTER_SEQUENCE {
    conda "${projectDir}/envs/cutadapt.yml"

    input:
    tuple val(meta), path(reads)

    output:
    path "*.noAdapt.fastq.gz"

    script:
    // input_fn=\${$reads/.fastq.gz/}
    def input_fn = "$reads.baseName"
    """
    trim-adapter.sh \\
        -f ${reads} \\
        -a TCGTATCCCGTCTTCTGCTTG
    """
}
