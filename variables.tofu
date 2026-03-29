# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "name" {
  default     = "osinfra-vpc"
  description = "Name of the network to create"
  type        = string
}

variable "project" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable "rules" {
  default     = []
  description = "List of firewall rule definitions"
  type = list(object({
    allow = optional(list(object({
      ports    = list(string)
      protocol = string
    })), [])

    deny = optional(list(object({
      ports    = list(string)
      protocol = string
    })), [])

    description         = optional(string)
    direction           = string
    log_config_enabled  = optional(bool, true)
    log_config_metadata = optional(string, "INCLUDE_ALL_METADATA")
    name                = string
    priority            = optional(number)
    ranges              = optional(list(string))
    source_tags         = optional(list(string))
    target_tags         = optional(list(string))
  }))
}

variable "shared_vpc" {
  default     = false
  description = "Enable VPC sharing"
  type        = bool
}

variable "shared_vpc_service_projects" {
  default     = []
  description = "The set of service projects to attach to the shared VPC"
  type        = set(string)
}
