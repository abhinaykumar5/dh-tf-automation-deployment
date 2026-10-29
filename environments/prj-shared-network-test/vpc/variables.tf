variable "project_id" {
  description = "GCP project ID where the VPCs are created."
  type        = string
}

variable "region" {
  description = "Default region for the Google provider."
  type        = string
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
