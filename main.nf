include { validateParameters; paramsSummaryLog; samplesheetToList } from 'plugin/nf-schema'

// Validate input parameters
validateParameters()

// Print summary of supplied parameters
log.info paramsSummaryLog(workflow)

// Create a new channel of metadata from a sample sheet passed to the pipeline through the --input parameter
ch_input = Channel.fromList(samplesheetToList(params.input, "assets/schema_input.json"))

include { TRIM_ADAPTER_SEQUENCE } from "./modules/trim_adapter_sequence"
include { TRIM_POLYA } from "./modules/trim_polya"
include { ALIGN_BWA } from "./modules/align_bwa"
include { INTERGENIC_TRANSCRIPTS } from "./modules/intergenic_transcripts/"

workflow {

    // TODO EXTEND_GENIC_TRANSCRIPTS(params.gene_bed, params.chrom_len)
    // TODO FASTQC
    TRIM_ADAPTER_SEQUENCE ( ch_input ) |
        TRIM_POLYA |
    // # (2) Trimming polyA tail: After trimming the adapter sequence, the output file from
        ALIGN_BWA (params.index) |
    // 3.4. Identification of Active Enhancers from GRO-seq Data
    // TODO GROHMM ( ) |
    INTERGENIC_TRANSCRIPTS (EXTEND_GENIC_TRANSCRIPTS.out) |
    // TODO DEFINE_ENHANCER_TRANSCRIPTS (params.short_paired_transcripts, short_paired_transcripts_1kb_window_overlap)
    // $ ./Define_enhancer_transcripts.pl -i intergenic_transcripts.txt -a short_paired_transcripts.txt -b short_paired_transcripts_overlap.txt -c short_paired_transcripts_1kb_window_overlap.txt
}
