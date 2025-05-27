# Configuration

## Executors

By default, the pipeline will use `base` configuration and the `local` executor defined respectively in `conf/base.config` and `conf/local.config`. The common configuration options are defined in the `conf/base.config` file, while the executor-specific options are defined in the `conf/local.config` file.

It is also possible to run the pipeline with a `google-batch` executor, which is defined in `conf/google-batch.config`. To use this executor, you need to run the pipeline with the `profile` option set to `google-batch`:

```bash
nextflow run main.nf -profile google-batch
```

> [!NOTE]
> Both executors (`local` and `google-batch`) will run by using the docker containers only.

## Input data & testing

Pipeline allows for running the test profile, which is defined in the `conf/test.config` file. This profile is used to run the pipeline with a small subset of data, which is useful for testing purposes. To run the pipeline with the test profile, use the following command:

```bash
nextflow run main.nf -profile test
```

> [!NOTE]
> One can also combine `test` and `google-batch` profiles, as `test` profile changes the input data, while `google-batch` profile changes the executor. To run the pipeline with both profiles, use the following command:
>
> ```bash
> nextflow run main.nf -profile test,google-batch
> ```
