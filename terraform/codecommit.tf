data "aws_codecommit_repository" "source_repository" {
    repository_name = "${var.source_repository}" 
}