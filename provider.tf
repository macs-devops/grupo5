terraform {
  required_providers {
    upcloud = {
      source = "UpCloudLtd/upcloud"
      version = "2.5.0"
    }
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

provider "upcloud" {
  username = var.upcloud_user
  password = var.upcloud_password
}

provider "google" {

  project     = var.project_id
  region      = var.region
  zone = var.zone
}

provider "google-beta" {

  project = var.project_id
  region  = var.region
  zone    = var.zone
}
