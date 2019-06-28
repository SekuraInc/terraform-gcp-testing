/*

provider "google" {

terraform {
  backend "gcs"{ 
    bucket  = "gcp-terraform-tfstate"
    prefix  = "${var.var_env}"
    //prefix  = "${format("%s","${var.company}-${var.env}")}"
    credentials = "${var.gcp_credentials}"
   }   
 }

*/