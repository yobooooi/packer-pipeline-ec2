resource "aws_s3_bucket" "codebuild_artifacts" {
    bucket = "${var.artefact_bucket_name}"
}