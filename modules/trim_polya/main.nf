process TRIM_POLYA {
    conda "${projectDir}/envs/cutadapt.yml"

    input:
    path reads

    output:
    path "*.noPolyA.noAdapt.fastq.gz"

    script:
    // input_fn=\${$reads/.fastq.gz/}
    def input_fn = "${reads}.baseName"
    """
    cutadapt \\
        -a AAAAAAAAAAAAAAAAAAAA \\
        -z \\
        -e 0.10 \\
        --minimum-length=32 \\
        --output=${reads}.noPolyA.noAdapt.fastq.gz \\
        $reads \\
        2>&1 >> ${input_fn}.trim-polyA.out
    """
}
