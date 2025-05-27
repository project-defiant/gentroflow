#!/usr/bin/env nextflow

include { FINNGEN_UKBB_META_INGESTION ; FINNGEN_MVP_UKBB_META_INGESTION } from "./workflows/finngen_meta.nf"


/**
* Function to ensure that the output directory is specified.
* @param outdir The output directory path.
* @throws Error if the output directory is not specified.
**/
def ensureOutdir(outdir) {
    if (!outdir) {
        error("Output directory must be specified using the --outdir parameter.")
    }
    return outdir
}

workflow {
    println("Starting workflow...")
    outdir = ensureOutdir(params.outdir)
    if (params.workflow_name == "finngen_ukbb_meta_ingestion") {
        println("Matched workflow: FINNGEN_UKBB_META_INGESTION")
        FINNGEN_UKBB_META_INGESTION(params.finngen, outdir)
    }
    else if (params.workflow_name == "finngen_mvp_ukbb_meta_ingestion") {
        println("Matched workflow: FINNGEN_MVP_UKBB_META_INGESTION")
        FINNGEN_MVP_UKBB_META_INGESTION(params.finngen, outdir)
    }
    else {
        error("Please specify one of the workflows defined in the `conf/workflow.config` file.")
    }

    workflow.onComplete {
        println("Workflow completed successfully.")
    }
}
