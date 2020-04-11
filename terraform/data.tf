data "template_file" "bucket_policy" {
    template = "${file("${path.module}/policies/s3_bucket_policy.json")}"

    vars = {
        codebuild_role    = "${aws_iam_role.codebuild_role.arn}"
        bucket_arn        = "${aws_s3_bucket.codebuild_artifacts.arn}"
        codepipeline_role = "${aws_iam_role.codepipeline_role.arn}"
    }
}

data "template_file" "codebuild_service_role" {
    template = "${file("${path.module}/policies/service_assume_role.json")}"

    vars = {
        service = "codebuild.amazonaws.com"
    }
}

data "template_file" "codebuild_policy" {
    template = "${file("${path.module}/policies/codebuild_policy.json")}"

    vars = {
        bucket_arn = "${aws_s3_bucket.codebuild_artifacts.arn}"
    }
}

data "template_file" "codepipeline_service_role" {
    template = "${file("${path.module}/policies/service_assume_role.json")}"

    vars = {
        service = "codepipeline.amazonaws.com"
    }
}

data "template_file" "codepipeline_policy" {
    template = "${file("${path.module}/policies/codepipeline_policy.json")}"

    vars = {
        bucket_arn     = "${aws_s3_bucket.codebuild_artifacts.arn}"
        codecommit_arn = "${data.aws_codecommit_repository.source_repository.arn}"
        codebuild_arn  = "${aws_codebuild_project.codebuild_project.arn}" 
    }
}