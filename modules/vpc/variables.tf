variable "project_id" {
  description = "GCP project ID that owns the VPC."
  type        = string
}

variable "name" {
  description = "Name of the VPC network."
  type        = string
}

variable "description" {
  description = "Description of the VPC network."
  type        = string
  default     = ""
}

variable "routing_mode" {
  description = "Network-wide routing mode. REGIONAL or GLOBAL."
  type        = string
  default     = "REGIONAL"

  validation {
    condition     = contains(["REGIONAL", "GLOBAL"], var.routing_mode)
    error_message = "routing_mode must be REGIONAL or GLOBAL."
  }
}

variable "mtu" {
  description = "Maximum transmission unit for the VPC. Allowed values are 1460 or 1500."
  type        = number
  default     = 1460

  validation {
    condition     = contains([1460, 1500], var.mtu)
    error_message = "mtu must be 1460 or 1500."
  }
}

variable "subnets" {
  description = "Subnets to create in the VPC, keyed by subnet name."
  type = map(object({
    region                   = string
    ip_cidr_range            = string
    description              = optional(string, "")
    private_ip_google_access = optional(bool, true)
  }))
  default = {}
}
