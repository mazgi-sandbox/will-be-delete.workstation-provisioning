module "simple-vpc" {
  source   = "mazgi/simple-vpc/google"
  version  = "2019.12.0"
  basename = var.basename
  cidr_blocks_subnetworks = {
    "10.0.0.0/16" = var.gcp_default_region
  }
  cidr_blocks_allow_ssh = ["0.0.0.0/0"]
}
