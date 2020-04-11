resource "aws_codepipeline" "wordpress-build-pipeline" {
    name     = "codepipeline-${var.project_name}"
    role_arn = "${aws_iam_role.codepipeline_role.arn}"

    artifact_store {
        location = "${aws_s3_bucket.codebuild_artifacts.bucket}"
        type     = "S3"
    }

    stage {
        name = "Source"

        action {
            name             = "checkout"
            category         = "Source"
            owner            = "AWS"
            provider         = "CodeCommit"
            version          = "1"
            output_artifacts = ["build"]

            configuration   = {
                RepositoryName       = "${data.aws_codecommit_repository.source_repository.repository_name}"
                PollForSourceChanges = "false"
                BranchName           = "master"
            }
        }
    }

    stage {
        name = "Build"

        action {
            name            = "build"
            category        = "Build"
            owner           = "AWS"
            provider        = "CodeBuild"
            input_artifacts = ["build"]
            version         = "1"

            configuration   = {
                ProjectName = "${aws_codebuild_project.codebuild_project.id}"
            }
        }
    }
}
