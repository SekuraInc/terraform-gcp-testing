variable "machine_type" {
    description = "GCP machine type"
    default = "n1-standard-1"
}

variable "instance_name" {
    description = "GCP instance name"
    default = "demo"
}

variable "image" {
    description = "GCP image"
    default = "debian-cloud/debian-9"
}

provider "google" {
    credentials = "${var.gcp_credentials}"
    project = "${var.gcp_project}"
    region = "us-east1"
}


resource "google_container_cluster" "k8sexample" {
  name               = "${var.vault_user}-k8s-cluster"
  description        = "example k8s cluster"
  zone               = "${var.gcp_zone}"
  initial_node_count = "${var.initial_node_count}"
  enable_kubernetes_alpha = "true"
  enable_legacy_abac = "true"

  master_auth {
    username = "${var.master_username}"
    password = "${var.master_password}"
  }

  node_config {
    machine_type = "${var.node_machine_type}"
    disk_size_gb = "${var.node_disk_size}"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}
