resource "google_compute_firewall" "ingress-allow-custom-ports-from-specific-ranges" {
  name    = "${var.basename}-ingress-custom-ports"
  network = module.simple-vpc.google_compute_network.main.self_link

  allow {
    protocol = "tcp"
    ports    = ["8080", "8888"]
  }

  source_ranges = var.acceptable_source_ipaddr_list

  target_tags = [
    "firewall-ingress-allow-custom-ports-from-specific-ranges",
  ]
}
