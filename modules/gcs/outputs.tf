output "bucket_names" {
  description = "Names of the created buckets."
  value       = { for name, bucket in google_storage_bucket.this : name => bucket.name }
}

output "bucket_urls" {
  description = "Google Cloud Storage URLs of the created buckets."
  value       = { for name, bucket in google_storage_bucket.this : name => bucket.url }
}