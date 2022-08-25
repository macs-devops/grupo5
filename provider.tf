terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.33.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  credentials = var.gcp-creds
  project     = var.project_id
  region      = var.region
  zone = var.zone
}

provider "google-beta" {
  credentials = var.gcp-creds
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
