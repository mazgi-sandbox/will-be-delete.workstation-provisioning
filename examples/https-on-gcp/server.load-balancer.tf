# See https://cloud.google.com/load-balancing/docs/https/

resource "google_compute_global_address" "server-lb" {
  name = "${var.basename}-server-lb"
}

resource "google_dns_record_set" "server-lb" {
  # provider     = "google-beta"
  name         = "server.${var.basedomain}."
  type         = "A"
  ttl          = 3600
  managed_zone = google_dns_managed_zone.main.name
  rrdatas = [
    google_compute_global_address.server-lb.address
  ]
}

# --------------------------------
# Forwarding rules configuration

resource "google_compute_global_forwarding_rule" "server-https" {
  # provider   = "google-beta"
  name       = "${var.basename}-server-https"
  target     = google_compute_target_https_proxy.server.self_link
  ip_address = google_compute_global_address.server-lb.address
  port_range = 443
}

resource "google_compute_global_forwarding_rule" "server-http" {
  # provider   = "google-beta"
  name       = "${var.basename}-server-http"
  target     = google_compute_target_http_proxy.server.self_link
  ip_address = google_compute_global_address.server-lb.address
  port_range = 80
}

# --------------------------------
# Target proxies configuration

resource "google_compute_target_https_proxy" "server" {
  # provider         = "google-beta"
  name             = "${var.basename}-server"
  url_map          = google_compute_url_map.server.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.server.self_link]
}

resource "google_compute_target_http_proxy" "server" {
  # provider         = "google-beta"
  name    = "${var.basename}-server"
  url_map = google_compute_url_map.server.self_link
}

# --------------------------------
# URL map configuration

resource "google_compute_url_map" "server" {
  # provider        = "google-beta"
  name            = "${var.basename}-server"
  default_service = google_compute_backend_service.server.self_link
  host_rule {
    hosts        = ["server.${var.basedomain}"]
    path_matcher = "allpaths"
  }
  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.server.self_link
    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.server.self_link
    }
  }
}

# --------------------------------
# Backend configuration

resource "google_compute_backend_service" "server" {
  # provider = "google-beta"
  name = "${var.basename}-server"
  backend {
    group = google_compute_instance_group.server.self_link
  }
  port_name   = "http-alt"
  protocol    = "HTTP"
  timeout_sec = 30
  health_checks = [
    google_compute_http_health_check.server.self_link
  ]
  security_policy = google_compute_security_policy.main.self_link
}

resource "google_compute_http_health_check" "server" {
  # provider = "google-beta"
  name               = "${var.basename}-server"
  request_path       = "/"
  port               = 8080
  check_interval_sec = 10
  timeout_sec        = 10
}
