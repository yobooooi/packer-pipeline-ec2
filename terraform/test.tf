provider "aws" {
    region  = "eu-west-1"
    profile = "synthesis-internal-dev"
}

module "codepipline" {
    source = "git::https://bitbucket.org/synthesis_admin/module-aws-codepipeline.git?ref=v1"

    project_name         = "wordpress-ami-pipeline"
    project_description  = "wordpress AMI pipeline builder using the AMI builder repository"
    artefact_bucket_name = "wordpress-ami-builder-artifact-bucket"

    # Name of the AMI-Builder CodeCommit Repository
    source_repository    = "ami-builder"

    # Environment Variables. PACKER_SCRIPT Required, because Build-Spec references
    # the environment variable to determine which packerfile to build from. Other
    # variables are optional.
    environment_vars = {
      PACKER_SCRIPT  = "packer-wordpress"
      VPC_ID         = "vpc-04f99e5833c3a909b"
      SUBNET_ID      = "subnet-0e3c6194859275f16"
    }
}

module "codepipline-squid-proxy" {
    source = "git::https://bitbucket.org/synthesis_admin/module-aws-codepipeline.git?ref=v1.01"

    project_name         = "squid-proxy-ami-pipeline"
    project_description  = "squid AMI pipeline builder using the AMI builder repository"
    artefact_bucket_name = "wordpress-ami-builder-artifact-bucket"

    # Name of the AMI-Builder CodeCommit Repository
    source_repository    = "ami-builder"

    # Environment Variables. PACKER_SCRIPT Required, because Build-Spec references
    # the environment variable to determine which packerfile to build from. Other
    # variables are optional.
    environment_vars = {
      PACKER_SCRIPT  = "packer-squidproxy"
      VPC_ID         = "vpc-04f99e5833c3a909b"
      SUBNET_ID      = "subnet-0e3c6194859275f16"
    }
}
