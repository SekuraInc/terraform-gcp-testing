
provider "google" {
  credentials = "${var.gcp_credentials}"
}

resource "google_project" "new_project" {
  count = "${length(var.projects)}"
  name = "${element(var.projects, count.index)}"
  project_id = "${element(var.projects, count.index)}"
  org_id     = "${var.org_id}"
  folder_id  = "${var.folder_id}"
  billing_account = "${var.billing_account}"
}

resource "google_service_account" "project_admin" {
  count = "${length(var.projects)}"
  account_id   = "project-admin"
  display_name = "Project Admin"
  project = "${element(google_project.new_project.*.project_id, count.index)}"
}

resource "google_project_iam_member" "project" {
  count = "${length(var.projects)}"
  project = "${element(google_project.new_project.*.project_id, count.index)}"
  role    = "roles/editor"
  member  = "user:${var.iam_user_email}"
}

resource "google_project_service" "cloud_compute" {
  count = "${length(var.projects)}"
  project = "${element(google_project.new_project.*.project_id, count.index)}"
  service = "compute.googleapis.com"

  disable_dependent_services = true
}

resource "google_project_service" "billing" {
  count = "${length(var.projects)}"  
  project = "${element(google_project.new_project.*.project_id, count.index)}"
  service = "cloudbilling.googleapis.com"

  disable_dependent_services = true
}




