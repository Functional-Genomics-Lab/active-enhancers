process DEFINE_ENHANCER_TRANSCRIPTS  {
    input:
    path genes
    path chrom_len

    output:
    path "intergenic_transcripts.txt"

    script:
    """
    Define_enhancer_transcripts.pl \\
        -i intergenic_transcripts.txt \\
        -a short_paired_transcripts.txt \\
        -b short_paired_transcripts_overlap.txt \\
        -c short_paired_transcripts_1kb_window_overlap.txt
    """
}
