// Identifying intergenic transcripts
process INTERGENIC_TRANSCRIPTS {
    input:
    path transcripts
    path genic_regions

    output:
    path "intergenic_transcripts.txt"

    script:
    """
    sort-k1,1-k2,2n ${transcripts}.txt ip_sorted.txt

    bedtools intersect \\
        -a $transcripts \\
        -b $genic_regions \\
        -v \\
        > intergenic_transcripts.txt
    """
}
