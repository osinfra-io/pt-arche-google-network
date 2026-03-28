# Local Values
# https://opentofu.org/docs/language/values/locals

locals {
  name            = "${local.prefix}-${module.core_helpers.region}"
  nat_subnetworks = var.source_subnetwork_ip_ranges_to_nat == "LIST_OF_SUBNETWORKS" ? toset(var.subnetwork_names) : []
  prefix          = var.prefix == "" ? var.network : var.prefix
}
