process ALIGN_BWA {
    input:
    path input_file
    path genome_index // NOTE Technically a fasta

    output:
    path "*.sorted.bam"

    script:
    def input_fn = "${input_file}.baseName"
    """
    # Aligning to the reference genome:
    bwa aln -n 2 -l 32 -t 8 $genome_index $input_file  > ${input_fn}.sai
    bwa samse $genome_index -n 1 ${input_fn}.sai $input_file > ${input_fn}.sam

    # Converting aligned files from sam to bam format
    samtools view -bh -S ${input_fn}.sam > ${input_fn}.unsorted.bam
    samtools sort ${input_fn}.unsorted.bam ${input_fn}.sorted
    """
}
