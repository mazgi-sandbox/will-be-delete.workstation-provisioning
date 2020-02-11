output "workstation-ipaddr" {
  value = google_compute_instance.workstation.network_interface[0].access_config[0].nat_ip
}
