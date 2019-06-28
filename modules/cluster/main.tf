resource "google_container_cluster" "platform_name" {
  name = "${var.platform_name}-cluster"
  network = "${var.network_name}"
  subnetwork = "${var.subnetwork_name}"
  zone = "${var.gcloud_zone}"

  initial_node_count = "${var.cluster_node_initial_count}"

  addons_config {
    kubernetes_dashboard {
      disabled = "${var.disable_dashboard}"
    }

    http_load_balancing {
      disabled = "${var.disable_autoscaling_addon}"
    }
  }
  
  master_auth {
    username = "${var.cluster_master_auth_username}"
    password = "${var.cluster_master_auth_password}"
  }


  # node configuration
  # NOTE: nodes created during the cluster creation become the default node pool
  node_config {
    image_type   = "${var.cluster_node_image_type}"
    machine_type = "${var.cluster_node_machine_type}"
    disk_size_gb = "${var.cluster_node_disk_size_gb}"

    # The set of Google API scopes
    # The following scopes are necessary to ensure the correct functioning of the cluster
    oauth_scopes = [
      "https://www.googleapis.com/auth/projecthosting",
      "https://www.googleapis.com/auth/devstorage.full_control",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    # Tags can used to identify targets in firewall rules
    tags = ["${var.name}-cluster", "nodes"]
  }
  
}
