# see https://cloud.google.com/load-balancing/docs/https/
variable "gcp_http_load_balancer_source_ipaddr_list" {
  default = [
    "130.211.0.0/22",
    "35.191.0.0/16"
  ]
}

variable "gcp_project_id" {}

variable "gcp_default_region" {
  default = "asia-east1"
}

variable "basename" {}

variable "basedomain" {}

# Set your specific IP address range via direnv
variable "acceptable_source_ipaddr_list" {
  type = list
}
