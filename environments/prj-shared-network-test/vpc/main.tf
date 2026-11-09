provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "compute" {
  project            = var.project_id
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

module "vpc" {
  source   = "../../../modules/vpc"
  for_each = var.vpcs

  project_id  = var.project_id
  name        = each.key
  description = each.value.description
  subnets     = each.value.subnets

  depends_on = [google_project_service.compute]
}

resource "google_compute_shared_vpc_host_project" "this" {
  project = var.project_id

  depends_on = [google_project_service.compute]
}

resource "google_compute_shared_vpc_service_project" "this" {
  for_each = var.shared_vpc_service_projects

  host_project    = google_compute_shared_vpc_host_project.this.project
  service_project = each.value
}

resource "google_compute_subnetwork_iam_member" "network_user" {
  for_each = {
    for user in var.shared_vpc_network_users : "${user.region}/${user.subnetwork}/${user.member}" => user
  }

  project    = var.project_id
  region     = each.value.region
  subnetwork = each.value.subnetwork
  role       = "roles/compute.networkUser"
  member     = each.value.member

  depends_on = [module.vpc]
}
