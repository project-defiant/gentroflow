#!/usr/bin/env nextflow

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NAMED WORKFLOWS FOR PIPELINE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/
include { GENTROFLOW } from "./workflows/gentroflow.nf"

import nextflow.script.WorkflowDef
enum WorkflowType {
    FINNGEN_UKB_META_INGESTION,
}




workflow {
    println(GENTROFLOW.getClass())

    WorkflowDef w = switch(params.worflow_name) {
        case WorkflowType.FINNGEN_UKB_META_INGESTION.toLowerCase() -> GENTROFLOW
        default -> throw new IllegalArgumentException("Unknown workflow type: ${params.workflow_name}")
    }

    workflow.onComplete {
        println("Workflow completed successfully.")
    }
}
