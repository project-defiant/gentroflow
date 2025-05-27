#!/usr/bin/env nextflow

include { GENTROFLOW } from "./workflows/gentroflow.nf"
include { FINNGEN_UKBB_META_INGESTION; FINNGEN_MVP_UKBB_META_INGESTION } from "./workflows/finngen_meta.nf"

/**
* Function to restrict the execution of the workflow to specific executors.
* @param allowedExecutors List of allowed executor names.
* @param wf The workflow metadata object.
* @throws Error if the current executor is not in the list of allowed executors.
**/
def restrictExecutors(List<String> allowedExecutors, WorkflowMetadata wf) {
    if (!(wf.executor.name in allowedExecutors)) {
        error "Running workflow is supported only on ${allowedExecutors.join(', ')} executors."
    }
}


/**
* Function to ensure that the output directory is specified.
* @param outdir The output directory path.
* @throws Error if the output directory is not specified.
**/
def ensureOutdir(String outdir) {
    if (!outdir) {
        error "Output directory must be specified using the --outdir parameter."
    }
    return outdir
}

workflow {

    allowedExecutors = ["local", "google-batch"]
    restrictExecutors(allowedExecutors, workflow)
    outdir = ensureOutdir(params.outdir)

    if (params.workflow == "finngen_ukbb_meta_ingestion") {
        println("Running FINNGEN_UKBB_META_INGESTION workflow")
        FINNGEN_UKBB_META_INGESTION(conf: params.finngen.meta_analysis.ukbb, outdir: outdir)
    } else if (params.workflow == "finngen_mvp_ukbb_meta_ingestion") {
        println("Running FINNGEN_MVP_UKBB_META_INGESTION workflow")
        FINNGEN_MVP_UKBB_META_INGESTION(conf: params.finngen.meta_analysis.mvp_ukbb, outdir: outdir)
    } else {
        println( "Invalid workflow type specified.")
        exit 1
    }

    workflow.onComplete {
        println("Workflow completed successfully.")
    }
}
