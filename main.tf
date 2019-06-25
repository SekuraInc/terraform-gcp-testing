

resource "google_project" "new_project" {
  count = "${length(var.projects)}"
  name = "${element(var.projects, count.index)}"
  project_id = "${element(var.projects, count.index)}"
  org_id     = "${var.org_id}"
  folder_id  = "${var.folder_id}"
  billing_account = "${var.billing_account}"
}


