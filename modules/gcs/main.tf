resource "google_storage_bucket" "this" {
  for_each = var.buckets

  project                     = var.project_id
  name                        = each.key
  location                    = each.value.location
  storage_class               = each.value.storage_class
  force_destroy               = each.value.force_destroy
  uniform_bucket_level_access = each.value.uniform_bucket_level_access
  public_access_prevention    = each.value.public_access_prevention
  labels                      = each.value.labels

  versioning {
    enabled = each.value.versioning_enabled
  }
}