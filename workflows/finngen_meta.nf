

workflow FINNGEN_UKBB_META_INGESTION {
    take:
        conf
        outdir
    main:
        println("${conf}")
        println("Output directory: ${outdir}")

}




workflow FINNGEN_MVP_UKBB_META_INGESTION {
    take:
        conf
        outdir
    main:
        println("${conf}")
        println("Output directory: ${outdir}")

}
