# Compute Router Resource
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/compute_router

resource "google_compute_router" "cloud_nat" {
  name    = local.name
  network = var.network
  project = var.project
  region  = module.core_helpers.region
}

# Compute Router NAT Resource
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/compute_router_nat

resource "google_compute_router_nat" "this" {
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }

  name                               = local.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  project                            = var.project
  region                             = module.core_helpers.region
  router                             = google_compute_router.cloud_nat.name
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

  dynamic "subnetwork" {
    for_each = local.nat_subnetworks

    content {
      name                    = subnetwork.value
      source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }
  }
}
