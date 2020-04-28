provider "aws" {
    region  = "eu-west-1"
    profile = "sanlam-sbx001"
}

module "codepipline" {
    source = "git::https://bitbucket.org/synthesis_admin/module-aws-codepipeline.git"

    project_name         = "ami-pipeline"
    project_description  = "AMI pipeline builder using the AMI builder repository"
    artefact_bucket_name = "ami-builder-artifact-bucket"

    # Name of the AMI-Builder CodeCommit Repository
    source_repository    = "ami-builder"

    # Environment Variables. PACKER_SCRIPT Required, because Build-Spec references
    # the environment variable to determine which packerfile to build from. Other
    # variables are optional.
    environment_vars = {
      PACKER_SCRIPT  = "packer-wordpress"
      VPC_ID         = "vpc-0306eda6f9928750e"
      SUBNET_ID      = "subnet-0539b64619def41d1"
    }
}
