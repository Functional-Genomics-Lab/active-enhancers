process ALIGN_BWA {
    input:
    path reads
    path index

    output:
    path "*.sorted.bam"

    script:
    """
    align-bwa.sh -i hg19_genome_index.fa  -f inputfile.noPolyA.noAdapt.fastq.gz"
    """
}
