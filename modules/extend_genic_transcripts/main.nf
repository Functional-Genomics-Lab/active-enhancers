process EXTEND_GENIC_TRANSCRIPTS {
    input:
    path annotations
    path chrom_info

    output:
    path "*_10kb_flanking.bed"

    script:
    def input_fn = "${annotations}.baseName"
    // -a transcript_universe_from_groHMM.txt  -b genic_regions_to_avoid.bed"
    """
    bedtools slop \\
        -i $annotations \\
        -g $chrom_info \\
        -b 10000 \\
        > ${input_fn}\_10kb_flanking.bed
    """
}
