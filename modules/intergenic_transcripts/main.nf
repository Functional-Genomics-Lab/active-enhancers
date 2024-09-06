// Identifying intergenic transcripts
process INTERGENIC_TRANSCRIPTS {
    input:
    path transcripts
    path genic_regions

    output:
    path "intergenic_transcripts.txt"

    script:
    """
    bedtools intersect -a $transcripts -b $genic_regions -v > intergenic_transcripts.txt
    """
}
