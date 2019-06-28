variable "gcloud_zone" {}
variable "gcloud_region" {}

variable "platform_name" {}

variable "network_name" {}
variable "subnetwork_name" {}


variable "cluster_node_disk_size_gb" {
  description = "Size of the disk attached to each node, specified in GB"
  default     = 10
}

variable "cluster_node_machine_type" {
  description = "The name of a Google Compute Engine machine type"
  default     = "n1-standard-1"
}

variable "cluster_node_image_type" {
  description = "The image type to use for nodes. See supported image types https://cloud.google.com/kubernetes-engine/docs/concepts/node-images"
  default     = "COS"                                                                                                                             # Container-Optimized OS
}

variable "cluster_node_initial_count" {}

variable "cluster_master_auth_username" {}
variable "cluster_master_auth_password" {}

variable "disable_dashboard" {
  description = "Whether the Kubernetes Dashboard should be disabled"
  default     = false
}

variable "disable_autoscaling_addon" {
  description = "Whetherthe Autoscaling Pod addon should be disabled"
  default     = false
}

