terraform {
  required_providers {
    upcloud = {
      source = "UpCloudLtd/upcloud"
      version = "2.5.0"
    }
  }
}

provider "upcloud" {
  username = var.upcloud_user
  password = var.upcloud_password
}
