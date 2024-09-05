include { validateParameters; paramsSummaryLog; samplesheetToList } from 'plugin/nf-schema'

// Validate input parameters
validateParameters()

// Print summary of supplied parameters
log.info paramsSummaryLog(workflow)

// Create a new channel of metadata from a sample sheet passed to the pipeline through the --input parameter
ch_input = Channel.fromList(samplesheetToList(params.input, "assets/schema_input.json"))

include { TRIM_ADAPTER_SEQUENCE } from "./modules/trim_adapter_sequence"

workflow {
    // TODO FASTQC
    TRIM_ADAPTER_SEQUENCE ( ch_input )
    // # (2) Trimming polyA tail: After trimming the adapter sequence, the output file from
    // TODO bwa aln
    // TODO bwa samse
    // TODO samtools view
    // TODO samtools sort
    // 3.4. Identification of Active Enhancers from GRO-seq Data
    // $ sort-k1,1-k2,2n ip.txt ip_sorted.txt
    // $ bedtools intersect -a transcript_universe_from_groHMM.txt -b genic_regions_to_avoid.bed -v > intergenic_transcripts.txt
    // $ ./Define_enhancer_transcripts.pl -i intergenic_transcripts.txt -a short_paired_transcripts.txt -b short_paired_transcripts_overlap.txt -c short_paired_transcripts_1kb_window_overlap.txt
}
