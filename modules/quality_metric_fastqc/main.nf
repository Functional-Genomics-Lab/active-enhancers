process QUALITY_METRIC_FASTQC {
    publishDir 'results/fastqc'

    input:
    tuple val(meta), path(fastq)

    output:
    path "*.html", emit: html
    path "*.zip", emit: zip

    script:
    """
    fastqc $fastq
    """
}
