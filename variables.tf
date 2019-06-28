variable "gcp_project" {
  description = "GCP project name"	  description = "GCP project name"
}

variable "org_id" { default="189920249297" }

variable "folder_id" { default="747662050065" }

variable "billing_account" { default= "01E29D-DF668D-8C6E8B" }

variable "project" {  default     = "tmx-project-test-1" }

variable "iam_user_email" { default="hank.lin@tmx.com" }

variable "gcp_credentials" {}

variable "region" { default = "us-central1" }
variable "zones" { default = ["us-central1-b"] }

variable "env" { default = "test" }
variable "webservers_subnet_ip_range" { default = "10.216.1.0/25"}
variable "management_subnet_ip_range" { default = "10.216.1.128/25"}
variable "bastion_image" { default = "centos-7-v20170918" }
variable "bastion_instance_type" { default = "f1-micro" }
variable "ssh_user" {}
variable "ssh_key" {}
variable "db_region" { default = "us-central1" }
variable "appserver_count" { default = 2 }
variable "app_image" { default = "centos-7-v20170918" }
variable "app_instance_type" { default = "f1-micro" }

variable "cluster_node_machine_type" { default = "g1-small" }
variable "cluster_node_initial_count" { default = 2 }


variable "cluster_master_auth_username" { default = "username1234" }
variable "cluster_master_auth_password" { default = = "password1234" }
