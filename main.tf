
module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 2.0"

  name                = "tmx-project-test-1"
  random_project_id   = "true"
  org_id              = "189920249297"
  usage_bucket_name   = "tmx-project-test-1-bucket"
  usage_bucket_prefix = "pf/test/1/integration"
  billing_account     = "01E29D-DF668D-8C6E8B"
  folder_id           = "747662050065"

}
