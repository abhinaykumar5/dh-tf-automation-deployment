resource "google_compute_network" "this" {
  project                 = var.project_id
  name                    = var.name
  description             = var.description
  auto_create_subnetworks = false
  routing_mode            = var.routing_mode
  mtu                     = var.mtu
}

resource "google_compute_subnetwork" "this" {
  for_each = var.subnets

  project                  = var.project_id
  name                     = each.key
  description              = each.value.description
  region                   = each.value.region
  network                  = google_compute_network.this.id
  ip_cidr_range            = each.value.ip_cidr_range
  private_ip_google_access = each.value.private_ip_google_access
}
