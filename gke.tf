data "google_container_cluster" "primary" {
  name     = "pin-devops"
  location = var.regional ? var.region : var.zone
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name     = var.gke_nodepool_name
  location = var.regional ? var.region : var.zone
  cluster  = google_container_cluster.primary.name

  initial_node_count = var.initial_node_count
  autoscaling {
    min_node_count = var.min_nodes
    max_node_count = var.max_nodes
  }

  management {
    auto_repair  = true
    auto_upgrade = var.auto_upgrade
  }

  node_config {
    preemptible  = var.preemptible
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    image_type   = var.image_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    service_account = "pin2022@pin2022.iam.gserviceaccount.com"
    oauth_scopes    = var.oauth_scopes

    dynamic "taint" {
      for_each = var.taint
      content {
        key    = taint.value["key"]
        value  = taint.value["value"]
        effect = taint.value["effect"]
      }
    }

    # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster#mode
    # https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity#option_2_node_pool_modification
    workload_metadata_config {
      mode = var.workload_metadata_enabled ? "GKE_METADATA" : "GCE_METADATA"
    }
  }
}
