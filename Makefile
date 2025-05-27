finngen_ukbb_meta:
	@nextflow run . -profile test,finngen_ukbb_meta


finngen_mvp_ukbb_meta:
	@nextflow run . -profile test,finngen_mvp_ukbb_meta


test: finngen_mvp_ukbb_meta finngen_ukbb_meta
