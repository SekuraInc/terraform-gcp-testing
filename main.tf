
# Create a new Google Project 
provider "google" {
  credentials = "${var.gcp_credentials}"
  project     = "${var.project}"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_project" "new_project" {
  name            = "${var.project}"
  project_id      = "${var.project}"
  folder_id       = "${var.folder_id}"
  billing_account = "${var.billing_account}"
}

resource "google_service_account" "project_admin" {
  account_id   = "project-admin"
  display_name = "Project Admin"
  project      = "${google_project.new_project.project_id}"
}

resource "google_project_iam_member" "project" {
  project = "${google_project.new_project.project_id}"
  role    = "roles/editor"
  member  = "user:${var.iam_user_email}"
}

resource "google_project_service" "cloud_compute" {
  project = "${google_project.new_project.project_id}"
  service = "compute.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "billing" {
  project = "${google_project.new_project.project_id}"
  service = "cloudbilling.googleapis.com"
  disable_dependent_services = true
}


