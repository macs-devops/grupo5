terraform {
 backend "gcs" {
   bucket  = "pin2022-tfstate"
   prefix  = "terraform/state"
 }
}
