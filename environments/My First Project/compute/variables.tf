variable "project_id" {
  description = "The project ID."
  type        = string
}

variable "region" {
  description = "The region."
  type        = string
}

variable "compute" {
  description = "The compute instances."
  type = map(object({
    machine_type = string
    zone         = string
    tags         = list(string)
    network      = string
    subnetwork   = string
    disk_name    = string
    disk_size    = number
    disk_type    = string
  }))
}