# Compute Subnetwork Resource
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/compute_subnetwork

resource "google_compute_subnetwork" "this" {
  ip_cidr_range = var.ip_cidr_range

  dynamic "log_config" {
    for_each = local.log_config_enabled
    content {
      aggregation_interval = "INTERVAL_5_SEC"
      flow_sampling        = 1
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }

  name                     = var.name
  network                  = var.network
  private_ip_google_access = var.private_ip_google_access
  project                  = var.project
  purpose                  = var.purpose
  region                   = module.core_helpers.region
  role                     = var.role

  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_ranges

    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }
}
