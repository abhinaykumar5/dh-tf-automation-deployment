variable "project_id" {
  description = "GCP project ID that owns the buckets."
  type        = string
}

variable "buckets" {
  description = "Cloud Storage buckets to create, keyed by globally unique bucket name."
  type = map(object({
    location                    = string
    storage_class               = optional(string, "STANDARD")
    force_destroy               = optional(bool, false)
    uniform_bucket_level_access = optional(bool, true)
    public_access_prevention    = optional(string, "enforced")
    versioning_enabled          = optional(bool, false)
    labels                      = optional(map(string), {})
  }))
  default = {}

  validation {
    condition = alltrue([
      for bucket in values(var.buckets) : contains(["enforced", "inherited"], bucket.public_access_prevention)
    ])
    error_message = "public_access_prevention must be either enforced or inherited."
  }
}