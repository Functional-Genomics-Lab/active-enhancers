process ALIGN_BWA {
    input:
    path reads
    path index

    output:
    path "*.sorted.bam"

    script:
    """
    align-bwa.sh -i ${index} -f ${reads}
    """
}
