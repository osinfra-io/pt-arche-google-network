# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "ip_cidr_range" {
  description = "The range of internal addresses that are owned by this subnetwork"
  type        = string
}

variable "name" {
  description = "The name of the resource, provided by the client when initially creating the resource. The resource name must be 1-63 characters long, and comply with RFC1035"
  type        = string
}

variable "network" {
  description = "The network this subnet belongs to. Only networks that are in the distributed mode can have subnetworks"
  type        = string
}

variable "private_ip_google_access" {
  default     = null
  description = "When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access"
  type        = bool
}

variable "project" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable "purpose" {
  default     = null
  description = "The purpose of the resource. This field can be either `PRIVATE_RFC_1918`, `INTERNAL_HTTPS_LOAD_BALANCER` or `REGIONAL_MANAGED_PROXY`"
  type        = string

  validation {
    condition     = var.purpose == null || contains(["PRIVATE_RFC_1918", "INTERNAL_HTTPS_LOAD_BALANCER", "REGIONAL_MANAGED_PROXY"], var.purpose)
    error_message = "The purpose must be one of: PRIVATE_RFC_1918, INTERNAL_HTTPS_LOAD_BALANCER, REGIONAL_MANAGED_PROXY"
  }
}

variable "role" {
  default     = null
  description = "The role of subnetwork. The value can be set to `ACTIVE` or `BACKUP`"
  type        = string

  validation {
    condition     = var.role == null || contains(["ACTIVE", "BACKUP"], var.role)
    error_message = "The role must be one of: ACTIVE, BACKUP"
  }
}

variable "secondary_ip_ranges" {
  default     = []
  description = "An array of configurations for secondary IP ranges for VM instances contained in this subnetwork"
  type = list(object({
    ip_cidr_range = string
    range_name    = string
  }))
}
