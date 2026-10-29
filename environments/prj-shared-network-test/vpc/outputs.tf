output "network_names" {
  description = "Names of the created VPCs."
  value       = { for name, vpc in module.vpc : name => vpc.network_name }
}

output "network_self_links" {
  description = "Self links of the created VPCs."
  value       = { for name, vpc in module.vpc : name => vpc.network_self_link }
}

output "subnet_ids" {
  description = "Subnet IDs for each VPC."
  value       = { for name, vpc in module.vpc : name => vpc.subnet_ids }
}

output "subnet_ip_cidr_ranges" {
  description = "Primary CIDR ranges for each VPC."
  value       = { for name, vpc in module.vpc : name => vpc.subnet_ip_cidr_ranges }
}
