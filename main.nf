#!/usr/bin/env nextflow
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    PROJECT-DEFIANT/gentroflow
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Github : https://github.com/PROJECT-DEFIANT/gentroflow
----------------------------------------------------------------------------------------
*/

include { GENTROFLOW  } from './workflows/gentroflow'
include { PIPELINE_INITIALISATION } from './subworkflows/local/utils_nfcore_gentroflow_pipeline'
include { PIPELINE_COMPLETION     } from './subworkflows/local/utils_nfcore_gentroflow_pipeline'
include { samplesheetToList } from 'plugin/nf-schema'


workflow {

    main:

    PIPELINE_INITIALISATION (
        params.version,
        params.validate_params,
        args,
        params.outdir,
    )
    samplesheet = samplesheetToList(params.input, "${projectDir}/assets/schema_input.json")
    ch_samplesheet = Channel.fromList(samplesheet)
    ch_versions = Channel.empty()
    outdir = params.outdir

    GENTROFLOW (ch_samplesheet, ch_versions, outdir)
    PIPELINE_COMPLETION ( params.monochrome_logs )
}

