# --------------------------------
# Google Compute Engine instance configuration

resource "google_compute_address" "workstation-direct" {
  name = "${var.basename}-workstation-direct"
}

resource "google_compute_instance" "workstation" {
  #provider = "google-beta"

  name         = "${var.basename}-workstation"
  zone         = "${var.gcp_default_region}-a"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
      size  = 40
    }
  }

  // NOTE: The `network` is cannot work if you using "custom subnetmode network", you should set the `subnetwork` instead of the `network`.
  network_interface {
    subnetwork = module.simple-vpc.google_compute_subnetwork.main[0].self_link
    access_config {
      nat_ip = google_compute_address.workstation-direct.address
    }
  }

  tags = concat(
    module.simple-vpc.google_compute_firewall.ingress-allow-ssh-from-specific-ranges.target_tags[*],
    google_compute_firewall.ingress-allow-custom-ports-from-specific-ranges.target_tags[*],
  )

  #metadata_startup_script = <<-EOF
  ##!/bin/bash -eu
  #curl -L github.com/mazgi.keys > /home/hidenori_matsuki/.ssh/authorized_keys2
  #EOF
}
