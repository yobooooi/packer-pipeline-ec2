provider "aws" {
    region  = "eu-west-1"
    profile = "synthesis-internal-dev"
}

module "codepipline" {
    source = "git::https://bitbucket.org/synthesis_admin/module-aws-codepipeline.git"

    project_name         = "wordpress-ami-pipeline"
    project_description  = "wordpress AMI pipeline builder using the AMI builder repository"
    artefact_bucket_name = "wordpress-ami-builder-artifact-bucket"
    source_repository    = "ami-builder"

    environment_vars = {
      PACKER_SCRIPT  = "packer-wordpress"
      VPC_ID         = "vpc-04f99e5833c3a909b"
      SUBNET_ID      = "subnet-0e3c6194859275f16"
    }
}
