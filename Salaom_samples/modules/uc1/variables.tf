
variable "var_uc1_private_subnet" {}
variable "var_uc1_public_subnet" {}
variable "company" {}
variable "env" {}
variable "var_region_name" {
        default = "us-central1"
    }
variable admin_username{
default="admin"
}

variable "region_map" {
       type = "map"
    default = {
       us-central1 = "uc1"
       ue1 = "us-east1"
	     uc1 = "us-central1"
	   }
    }

variable "network_self_link" {
        description = "output from global module"
    }

#############################Instance########

variable "subnetwork1" {
        description = "network name for instance"
    }

variable "var_zones" {
  description = "Run the Instances in these Zones"
  type = "list"
  #default = ["us-east1-b", "us-east1-c", "us-east1-d"]
  default = ["us-central1-a", "us-central1-b", "us-central1-c", "us-central1-f"] 
}
