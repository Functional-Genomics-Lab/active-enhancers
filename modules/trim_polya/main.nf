process TRIM_POLYA {
    conda "${projectDir}/envs/cutadapt.yml"

    input:
    path reads

    output:
    path "*.noPolyA.noAdapt.fastq.gz"

    script:
    """
    trim-polyA.sh -f ${reads}
    """
}
