# Required Providers
# https://opentofu.org/docs/language/providers/requirements

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

# Google Network
# https://github.com/osinfra-io/pt-arche-google-network

module "all_subnets_test" {
  source = "../../../../regional/nat"

  network = "mock-vpc"
  project = var.project
}

# Google Network
# https://github.com/osinfra-io/pt-arche-google-network

module "list_of_subnets_test" {
  source = "../../../../regional/nat"

  network                            = "mock-vpc"
  prefix                             = "mock-vpc-subnetworks"
  project                            = var.project
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork_names                   = ["mock-subnetwork"]
}
