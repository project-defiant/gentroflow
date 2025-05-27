#!/usr/bin/env nextflow

include { FINNGEN_UKBB_META_INGESTION ; FINNGEN_MVP_UKBB_META_INGESTION } from "./workflows/finngen_meta.nf"
include { PIPELINE_INITIALISATION ; PIPELINE_COMPLETION } from "./subworkflows/local/utils_nfcore_gentroflow_pipeline/main.nf"



workflow {
    init = PIPELINE_INITIALISATION(params.version, params.validate_params, args, params.outdir)

    if (params.workflow_name == "finngen_ukbb_meta_ingestion") {
        log.info("Matched workflow: FINNGEN_UKBB_META_INGESTION")
        FINNGEN_UKBB_META_INGESTION(params, init.outdir)
    }
    else if (params.workflow_name == "finngen_mvp_ukbb_meta_ingestion") {
        log.info("Matched workflow: FINNGEN_MVP_UKBB_META_INGESTION")
        FINNGEN_MVP_UKBB_META_INGESTION(params, init.outdir)
    }
    else {
        error("Please specify one of the workflows defined in the `conf/workflow.config` file.")
    }

    PIPELINE_COMPLETION(params.monochrome_logs)
}
