process ALIGN_BWA {
    input:
    path reads
    path fasta

    output:
    path "*.sorted.bam"

    script:
    """
    align-bwa.sh -i $fasta -f $reads
    """
}
