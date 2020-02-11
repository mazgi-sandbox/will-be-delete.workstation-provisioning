variable "gcp_project_id" {}

variable "gcp_default_region" {
  default = "asia-east1"
}

variable "basename" {}

# Set your specific IP address range via direnv
variable "acceptable_source_ipaddr_list" {
  type = list
}
