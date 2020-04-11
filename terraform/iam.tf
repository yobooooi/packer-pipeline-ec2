resource "aws_iam_role" "codebuild_role" {
    name               = "codebuild-service-role"
    assume_role_policy = "${data.template_file.codebuild_service_role.rendered}"
}

resource "aws_iam_role_policy_attachment" "codebuild_role_attach" {
    role       = "${aws_iam_role.codebuild_role.name}"
    policy_arn = "${aws_iam_policy.codebuild_policy.arn}"
}

resource "aws_iam_policy" "codebuild_policy" {
    name        = "codebuild_policy"
    path        = "/"
    description = "permissions required for codebuild to pull from s3 and create AMIs"
    policy      = "${data.template_file.codebuild_policy.rendered}"
}

resource "aws_iam_role" "codepipeline_role" {
    name               = "codepipeline-service-role"
    assume_role_policy = "${data.template_file.codepipeline_service_role.rendered}"
}

resource "aws_iam_role_policy_attachment" "codepipeline_role_attach" {
    role       = "${aws_iam_role.codepipeline_role.name}"
    policy_arn = "${aws_iam_policy.codepipeline_policy.arn}"
}

resource "aws_iam_policy" "codepipeline_policy" {
    name        = "codepipeline_policy"
    path        = "/"
    description = "Permissions required for Pipeline to interrogate s3 for up"
    policy      = "${data.template_file.codepipeline_policy.rendered}"
}