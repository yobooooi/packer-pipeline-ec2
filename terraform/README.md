# CodePipeline Terraform Module

The purpose of this module builds the infrastructure required for a CI pipeline in AWS. It provisions a CodeCommit source code repository, a CodeBuild Project and a CodePipeline with which the CodeBuild, and CodeCommit resources are associated to. An ECR is also created, where the resulting containers are uploaded too. A sample BuildSpec file is in the test directory, which can be used to run a docker build, and a docker push to the ECR.


## Prerequisites
* Terraform v0.12
* AWS Account
* Source Code and a Working BuildSpec File

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| project_name | Name of the project that will be used to prefix all resource with that will be create with this module | string | n/a | yes |
| project_description | Description of the Project i.e. `"Customer Satisfaction WordPress Site"` | string | n/a | yes |
| bucket_name | Name of the S3 bucket that will be used for temproray artifact storage | string | n/a | yes |

## Outputs

* CodeCommit Repository
* CodeBuild Project
* CodePipeline Project
* ECR Repository

## Example
```
provider "aws" {
    region  = "us-west-1"
    profile = "synthesis-internal-dev"
}

module "codepipline" {
    source = "../"

    project_name        = "wordpress-container-pipeline"
    project_description = "pipeline for wordpress container"
    bucket_name         = "wordpress-container-pipeline-artifact-bucket"
}
```

## ToDo's

* Deploy Stage for the Pipelines
* Creat default IAM user with access to CodeCommit 