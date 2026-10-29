variable "name" {
  description = "The name of the compute instance."
  type        = string
}

variable "machine_type" {
  description = "The machine type of the compute instance."
  type        = string
}

variable "zone" {
  description = "The zone of the compute instance."
  type        = string
}

variable "tags" {
  description = "The tags of the compute instance."
  type        = list(string)
}

variable "network" {
  description = "The network of the compute instance."
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork of the compute instance."
  type        = string
}

variable "boot_image" {
  description = "Image used to create the instance boot disk."
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "boot_disk_size" {
  description = "Size of the boot disk in GB."
  type        = number
  default     = 10
}

variable "boot_disk_type" {
  description = "Type of the boot disk."
  type        = string
  default     = "pd-balanced"
}

variable "disk_name" {
  description = "The name of the disk."
  type        = string
}

variable "disk_size" {
  description = "The size of the disk."
  type        = number
}

variable "disk_type" {
  description = "The type of the disk."
  type        = string
}

variable "disk_zone" {
  description = "The zone of the disk."
  type        = string
}