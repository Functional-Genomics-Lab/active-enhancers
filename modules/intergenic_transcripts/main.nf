process INTERGENIC_TRANSCRIPTS {
    input:
    path grohmm
    path genic_regions_to_avoid

    output:
    path "intergenic_transcripts.txt"

    script:
    // -a transcript_universe_from_groHMM.txt  -b genic_regions_to_avoid.bed"
    """
    intergenic-transcripts.sh -a $grohmm -b $genic_regions_to_avoid
    """
}
