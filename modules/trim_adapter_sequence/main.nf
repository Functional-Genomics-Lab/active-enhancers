process TRIM_ADAPTER_SEQUENCE {
    conda "cutadapt'<2.0'"

    input:
    tuple val(meta), path(reads)

    output:
    path "*.noAdapt.fastq.gz"

    script:
    // input_fn=\${$reads/.fastq.gz/}
    def input_fn = "$reads.baseName"
    """
    cutadapt -a adapter -z -e 0.10 --minimum-length=32 --output=${input_fn}.noAdapt.fastq.gz $reads 2>&1 >> ${input_fn}.trim-adapter.out

    trim-adapter.sh \\
        -f ${reads} \\
        -a TCGTATCCCGTCTTCTGCTTG
    """
}
