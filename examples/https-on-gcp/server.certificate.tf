resource "google_compute_managed_ssl_certificate" "server" {
  provider = "google-beta"
  name     = "${var.basename}-server"
  managed {
    domains = [
      "server.${var.basedomain}"
    ]
  }
}
