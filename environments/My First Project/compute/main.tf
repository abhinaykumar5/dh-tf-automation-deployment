provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "compute" {
  project            = var.project_id
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

module "compute" {
  source   = "../../../modules/compute"
  for_each = var.compute

  name         = each.key
  machine_type = each.value.machine_type
  zone         = each.value.zone
  tags         = each.value.tags
  network      = each.value.network
  subnetwork   = each.value.subnetwork
  disk_name    = each.value.disk_name
  disk_size    = each.value.disk_size
  disk_type    = each.value.disk_type
  disk_zone    = each.value.zone

  depends_on = [google_project_service.compute]
}