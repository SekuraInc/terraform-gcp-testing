variable "gcp_project" {
  description = "GCP project name"	  description = "GCP project name"
}

variable "org_id" { default="189920249297" }

variable "folder_id" { default="747662050065" }

variable "billing_account" { default= "01E29D-DF668D-8C6E8B" }

variable "project" {  default     = "tmx-project-test-1" }

variable "iam_user_email" { default="hank.lin@tmx.com" }

variable "gcp_credentials" {}

variable "machine_type" {
    description = "GCP machine type"
    default = "n1-standard-1"
}

variable "instance_name" {
    description = "GCP instance name"
    default = "instance-by-terraform"
}

variable "image" {
    description = "GCP image"
    default = "debian-cloud/debian-9"
}

variable "gcp_zone" {
  description = "GCP zone, e.g. us-east1-a"
  default = "us-central1-c"
}