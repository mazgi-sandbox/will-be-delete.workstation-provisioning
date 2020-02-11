resource "google_compute_instance_group" "server" {
  # provider  = "google-beta"
  name      = "${var.basename}-server"
  instances = google_compute_instance.server[*].self_link
  named_port {
    name = "http-alt"
    port = "8080"
  }
}
