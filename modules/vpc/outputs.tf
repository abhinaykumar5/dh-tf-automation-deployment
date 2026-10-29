output "network_id" {
  description = "ID of the VPC network."
  value       = google_compute_network.this.id
}

output "network_name" {
  description = "Name of the VPC network."
  value       = google_compute_network.this.name
}

output "network_self_link" {
  description = "Self link of the VPC network."
  value       = google_compute_network.this.self_link
}

output "subnet_ids" {
  description = "Map of subnet name to subnet ID."
  value       = { for name, subnet in google_compute_subnetwork.this : name => subnet.id }
}

output "subnet_self_links" {
  description = "Map of subnet name to subnet self link."
  value       = { for name, subnet in google_compute_subnetwork.this : name => subnet.self_link }
}

output "subnet_ip_cidr_ranges" {
  description = "Map of subnet name to primary CIDR range."
  value       = { for name, subnet in google_compute_subnetwork.this : name => subnet.ip_cidr_range }
}
