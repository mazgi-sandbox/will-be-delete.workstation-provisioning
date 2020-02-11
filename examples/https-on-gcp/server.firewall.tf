resource "google_compute_firewall" "ingress-allow-custom-ports-from-lb" {
  name    = "${var.basename}-ingress-custom-ports-from-lb"
  network = module.simple-vpc.google_compute_network.main.self_link

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = var.gcp_http_load_balancer_source_ipaddr_list

  target_tags = [
    "firewall-ingress-allow-custom-ports-from-lb",
  ]
}
