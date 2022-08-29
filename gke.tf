data "google_container_cluster" "primary" {
  name     = "pin-devops"
  location = var.regional ? var.region : var.zone
}

resource "kubernetes_namespace" "service-wordpress" {

 metadata {
   name = "service-wordpress"
 }
}
