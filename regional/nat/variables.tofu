# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "network" {
  description = "The network to enable Cloud NAT on"
  type        = string
}

variable "prefix" {
  default     = ""
  description = "The prefix for the resource name.  Defaults to var.network"
  type        = string
}

variable "project" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable "source_subnetwork_ip_ranges_to_nat" {
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  description = "How NAT should be configured per Subnetwork.  Possible values are ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, and LIST_OF_SUBNETWORKS"
  type        = string

  validation {
    condition     = contains(["ALL_SUBNETWORKS_ALL_IP_RANGES", "ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES", "LIST_OF_SUBNETWORKS"], var.source_subnetwork_ip_ranges_to_nat)
    error_message = "The source_subnetwork_ip_ranges_to_nat must be one of: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS"
  }
}

variable "subnetwork_names" {
  default     = []
  description = "Subnet names for NAT configuration.  Only used if source_subnetwork_ip_ranges_to_nat is set to LIST_OF_SUBNETWORKS"
  type        = list(string)
}
