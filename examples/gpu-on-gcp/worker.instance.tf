# --------------------------------
# Google Compute Engine instance configuration

resource "google_compute_instance" "worker" {
  count = 2
  #provider = "google-beta"

  name         = "${var.basename}-worker-${count.index + 1}"
  zone         = "${var.gcp_default_region}-a"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      # https://cloud.google.com/ai-platform/deep-learning-vm/docs/images
      image = "deeplearning-platform-release/common-cu101"
    }
  }

  // NOTE: The `network` is cannot work if you using "custom subnetmode network", you should set the `subnetwork` instead of the `network`.
  network_interface {
    subnetwork = module.simple-vpc.google_compute_subnetwork.main[0].self_link
    access_config {}
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
