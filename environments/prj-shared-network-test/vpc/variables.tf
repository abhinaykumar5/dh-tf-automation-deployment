variable "project_id" {
  description = "GCP project ID where the VPCs are created."
  type        = string
}

variable "region" {
  description = "Default region for the Google provider."
  type        = string
}

variable "shared_vpc_service_projects" {
  description = "Service projects attached to this project as a Shared VPC host."
  type        = set(string)
  default     = []
}

variable "shared_vpc_network_users" {
  description = "Members granted roles/compute.networkUser on a host subnet."
  type = list(object({
    member     = string
    subnetwork = string
    region     = string
  }))
  default = []
}

variable "vpcs" {
  description = "VPC networks to create, keyed by network name."
  type = map(object({
    description = optional(string, "")
    subnets = map(object({
      region                   = string
      ip_cidr_range            = string
      description              = optional(string, "")
      private_ip_google_access = optional(bool, true)
    }))
  }))
}
