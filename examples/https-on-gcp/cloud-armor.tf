resource "google_compute_security_policy" "main" {
  provider = "google-beta"
  name     = "${var.basename}-main"
  rule {
    action   = "deny(403)"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
  }
  rule {
    action   = "allow"
    priority = "1000"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = var.acceptable_source_ipaddr_list
      }
    }
  }
}
