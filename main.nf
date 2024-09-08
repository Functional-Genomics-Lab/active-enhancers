include { validateParameters; paramsSummaryLog; samplesheetToList } from 'plugin/nf-schema'

// Validate input parameters
// TODO validateParameters()

// Print summary of supplied parameters
log.info paramsSummaryLog(workflow)

// Create a new channel of metadata from a sample sheet passed to the pipeline through the --input parameter
ch_input = Channel.fromList(samplesheetToList(params.input, "assets/schema_input.json"))

include { QUALITY_METRIC_FASTQC } from "./modules/quality_metric_fastqc"
include { TRIM_ADAPTER_SEQUENCE } from "./modules/trim_adapter_sequence"
include { TRIM_POLYA } from "./modules/trim_polya"
include { BWA_INDEX } from "./modules/bwa_index"
include { ALIGN_BWA } from "./modules/align_bwa"
include { EXTEND_GENIC_TRANSCRIPTS } from "./modules/extend_genic_transcripts"
include { GROHMM_TRANSCRIPTCALLING } from "./modules/grohmm/transcriptcalling"
include { INTERGENIC_TRANSCRIPTS } from "./modules/intergenic_transcripts"
include { DEFINE_ENHANCER_TRANSCRIPTS } from "./modules/define_enhancer_transcripts"


workflow {
    QUALITY_METRIC_FASTQC ( ch_input )

    TRIM_ADAPTER_SEQUENCE ( ch_input, params.adapter_sequence ) |
        // # (2) Trimming polyA tail: After trimming the adapter sequence, the output file from
        TRIM_POLYA

    BWA_INDEX (params.fasta)
    ch_bams = ALIGN_BWA (TRIM_POLYA.out, BWA_INDEX.out).collect()
    // 3.4. Identification of Active Enhancers from GRO-seq Data
    GROHMM_TRANSCRIPTCALLING ( ch_bams, params.gtf, [] )

    EXTEND_GENIC_TRANSCRIPTS(params.gene_bed, params.chrom_len)
    INTERGENIC_TRANSCRIPTS (
        GROHMM_TRANSCRIPTCALLING.out.transcripts_bed,
        EXTEND_GENIC_TRANSCRIPTS.out,
    ) | DEFINE_ENHANCER_TRANSCRIPTS
}
