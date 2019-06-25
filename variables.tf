variable "gcp_project" {
  description = "GCP project name"	  description = "GCP project name"
}	}

variable "org_id" { default="189920249297" }

variable "folder_id" { default="747662050065" }

variable "billing_account" { default= "01E29D-DF668D-8C6E8B" }

variable "projects" {
  type        = "list"
  default     = ["tmx-project-test-1"]
}


variable "gcp_credentials" {}

