process EXTEND_GENIC_TRANSCRIPTS {
    input:
    path genes
    path chrom_len

    output:
    path "intergenic_transcripts.txt"

    script:
    // -a transcript_universe_from_groHMM.txt  -b genic_regions_to_avoid.bed"
    """
    extend-genic-transcripts.sh -f $genes -g $chrom_len
    """
}
