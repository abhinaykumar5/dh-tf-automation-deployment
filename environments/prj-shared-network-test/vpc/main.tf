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
