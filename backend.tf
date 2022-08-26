resource "google_storage_bucket" "default" {
  name          = "pin2022-tfstate"
  force_destroy = false
  location      = "US"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

terraform {
 backend "gcs" {
   bucket  = google_storage_bucket.default.name
   prefix  = "terraform/state"
 }
}
