
provider "google" {
  credentials = "${var.gcp_credentials}"
  project = "${var.project}"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_project" "new_project" {
  name = = "${var.project}"
  project_id = "${var.project}"
  folder_id  = "${var.folder_id}"
  billing_account = "${var.billing_account}"
}

resource "google_service_account" "project_admin" {
  account_id   = "project-admin"
  display_name = "Project Admin"
  project = "${element(google_project.new_project.*.project_id, count.index)}"
}

resource "google_project_iam_member" "project" {
  project = "${element(google_project.new_project.*.project_id, count.index)}"
  role    = "roles/editor"
  member  = "user:${var.iam_user_email}"
}

resource "google_project_service" "cloud_compute" {
  project = "${element(google_project.new_project.*.project_id, count.index)}"
  service = "compute.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "billing" {
  project = "${element(google_project.new_project.*.project_id, count.index)}"
  service = "cloudbilling.googleapis.com"

  disable_dependent_services = true
}




