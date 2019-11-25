/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "network_name" {
  value       = module.vpc.network_name
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value       = module.vpc.network_self_link
  description = "The URI of the VPC being created"
}

output "svpc_host_project_id" {
  value       = module.vpc.svpc_host_project_id
  description = "Shared VPC host project id."
}

output "subnets_names" {
  value       = [for network in google_compute_subnetwork.subnetwork : network.name]
  description = "The names of the subnets being created"
}

output "subnets_ips" {
  value       = [for network in google_compute_subnetwork.subnetwork : network.ip_cidr_range]
  description = "The IPs and CIDRs of the subnets being created"
}

output "subnets_self_links" {
  value       = [for network in google_compute_subnetwork.subnetwork : network.self_link]
  description = "The self-links of subnets being created"
}

output "subnets_regions" {
  value       = [for network in google_compute_subnetwork.subnetwork : network.region]
  description = "The region where the subnets will be created"
}

output "subnets_private_access" {
  value       = [for network in google_compute_subnetwork.subnetwork : network.private_ip_google_access]
  description = "Whether the subnets will have access to Google API's without a public IP"
}

output "subnets_flow_logs" {
  value       = [for network in google_compute_subnetwork.subnetwork : network.enable_flow_logs]
  description = "Whether the subnets will have VPC flow logs enabled"
}

output "subnets_secondary_ranges" {
  value       = [for network in google_compute_subnetwork.subnetwork : network.secondary_ip_range]
  description = "The secondary ranges associated with these subnets"
}

output "routes" {
  value       = google_compute_route.route.*.name
  description = "The routes associated with this VPC"
}
