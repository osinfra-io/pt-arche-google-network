# Local Values
# https://opentofu.org/docs/language/values/locals

locals {
  description                       = coalesce(var.description, "DNS zone for ${var.dns_name}")
  dnssec_config_enabled             = var.visibility != "public" ? [] : [1]
  private_visibility_config_enabled = var.visibility != "private" ? [] : length(var.private_visibility_config_networks) == 0 ? [] : [1]
}
