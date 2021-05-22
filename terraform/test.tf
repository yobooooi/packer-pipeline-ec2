terraform {
  backend "s3" {
    bucket = "enveldemo-tfstate"
    key = "pipelines"
    region = "eu-west-1"
    profile = "internal-dev"
  }
}
provider "aws" {
    region  = "eu-west-1"
    profile = "internal-dev"
    default_tags {
      tags = {
        "Environment" = "Development"
        "Owner" = "Adan"
        "Project" = "EnvelDemo"
        "Terraform_Managed" = "True"
      }
    }
}

module "envel-wordpress-codepipline" {
    source = "git::git@github.com:yobooooi/tfmodule-aws-codepipeline.git?ref=v1.0"

    project_name         = "enveldemo-wordpress-ami-pipeline"
    project_description  = "enveldemo-wordpress-ami-pipeline-demo"
    artefact_bucket_name = "codepipline-artefacts"
    source_repository    = "enveldemo-ami-builder"

    environment_vars = {
      PACKER_SCRIPT  = "packer-wordpress"
      VPC_ID         = "vpc-04f99e5833c3a909b"
      SUBNET_ID      = "subnet-0e3c6194859275f16"
    }
}