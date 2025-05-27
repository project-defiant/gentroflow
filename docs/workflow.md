# Workflows

## finngen_ukbb_meta_ingestion

### Description

This workflow is run by specifying the `--workflow finngen_ukbb` parameter.

The full configuration used to ingest the meta analysis is defined in the `/conf/datasources/finngen.config`. By default the workflow will run with the google cloud batch configuration, as this is the default profile used in Open Targets. To adjust run one may have to create a new profile for the run.

With the gcs profile, the workflow starts directly from the release bucket provided by the FinnGen dataset. To run the step locally one may need to download the files from the bucket first and ensure the catalog structure is the same as in the bucket.

> [!NOTE]
> One can download the files from the bucket using the following command:
>
> ```bash
>  export DATA_PATH="/data/finngen-public-data-r12/meta_analysis/ukbb"
>  mkdir -p $DATA_PATH
>  gcloud storage rsync -r gs://finngen-public-data-r12/meta_analysis/ukbb $DATA_PATH
> ```
