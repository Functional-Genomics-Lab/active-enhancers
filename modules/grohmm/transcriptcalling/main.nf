process GROHMM_TRANSCRIPTCALLING {
    // tag "$meta.id"
    label 'process_high'
    label 'process_long'

    conda "${moduleDir}/environment.yml"

    input:
    path bams
    path gtf
    path tuning_file

    output:
    path "*.transcripts.txt", emit: transcripts
    // tuple val(meta), path("*.eval.txt")       , emit: eval
    path "*.transcripts.bed", emit: transcripts_bed
    // tuple val(meta), path("*.tdFinal.txt")    , emit: td
    // tuple val(meta), path("*.tdplot_mqc.jpg") , emit: td_plot
    // path  "versions.yml"     , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    // def prefix = task.ext.prefix ?: "${meta.id}"
    def tuning = tuning_file ? "--tuning_file ${tuning_file}" : ""
    """
    transcriptcalling_grohmm.R \\
        --bam_file ${bams} \\
        $tuning \\
        --outprefix blah \\
        --gtf $gtf \\
        --outdir ./ \\
        --cores $task.cpus \\
        $args

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        r-base: \$(echo \$(R --version 2>&1) | sed 's/^.*R version //; s/ .*\$//')
        bioconductor-grohmm: \$(Rscript -e "library(groHMM); cat(as.character(packageVersion('groHMM')))")
    END_VERSIONS
    """
}
