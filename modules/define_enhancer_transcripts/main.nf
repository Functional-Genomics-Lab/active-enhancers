process DEFINE_ENHANCER_TRANSCRIPTS  {
    input:
    path intergenic_transcripts

    output:
    path "short_paired_transcripts.txt"
    path "short_paired_transcripts_overlap.txt"
    path "short_paired_transcripts_1kb_window_overlap.txt"

    script:
    """
    Define_enhancer_transcripts.pl \\
        -i $intergenic_transcripts \\
        -a short_paired_transcripts.txt \\
        -b short_paired_transcripts_overlap.txt \\
        -c short_paired_transcripts_1kb_window_overlap.txt
    """
}
