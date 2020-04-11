provider "aws" {
    region  = "eu-west-1"
    profile = "synthesis-internal-dev"
}

module "codepipline" {
    source = "../"

    project_name         = "wordpress-ami-pipeline"
    project_description  = "wordpress AMI pipeline builder using the AMI builder repository"
    artefact_bucket_name = "wordpress-ami-builder-artifact-bucket"
    packer_script        = "packer-wordpress"
    source_repository    = "ami-builder"

}
