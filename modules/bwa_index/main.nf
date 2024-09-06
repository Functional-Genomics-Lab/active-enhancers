process BWA_INDEX {
    input:
    path fasta

    output:
    path "bwa/"

    script:
    """
    mkdir bwa
    bwa \\
        index \\
        -p bwa/ \\
        $fasta
    """
}
