# --------------------------------
# Terraform configuration

terraform {
  required_version = "0.12.9"

  required_providers {
    google      = "3.3.0"
    google-beta = "3.3.0"
  }

  backend "gcs" {
    prefix = "terraform"
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_default_region
  zone    = "${var.gcp_default_region}-a"
}

provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_default_region
  zone    = "${var.gcp_default_region}-a"
}
