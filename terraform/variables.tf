variable "artefact_bucket_name" {
    description = "Bucket where artifacts are stored during building"
}

variable "project_name" {
    description = "Name of the project. This will be used to prefix all resources that will be provisioned"
}

variable "project_description" {
    description = "Description of the project .i.e Pipeline for Wordpress Project X"
}

variable "packer_script" {
    description = "Packer File to build"
}

variable "source_repository" {
    description = "Name of the source code repository to be used"
  
}

