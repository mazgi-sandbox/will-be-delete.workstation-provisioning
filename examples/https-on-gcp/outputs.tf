output "name_servers" {
  value = google_dns_managed_zone.main.name_servers
}

output "workstation-ipaddr" {
  value = google_compute_instance.workstation.network_interface[0].access_config[0].nat_ip
}
