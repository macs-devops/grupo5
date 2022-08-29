data "google_compute_network" "k8s_vpc" {
  name = "pin-devops-k8s-vpc"
  project = "pin2022"
}

data "google_compute_subnetwork" "iap_subnet" {
  name   = "pin-devops-iap-subnet"
  region = var.region
}

resource "google_compute_firewall" "iap_tcp_forwarding" {
  count   = var.enable_private_endpoint ? 1 : 0
  name    = "allow-ingress-from-iap"
  network = "pin-devops-k8s-vpc"

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22", "8888", "443"] # 8888 = tinyproxy port
  }

  # https://cloud.google.com/iap/docs/using-tcp-forwarding
  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["iap"]
}

data "google_compute_instance" "iap-proxy" {
  name = "gke-iap-prox"
  zone = var.zone
}
