project_id = "prj-shared-network-test-513109"
region     = "us-central1"

shared_vpc_service_projects = [
  "project-03ca8a54-2170-4c4e-8b7",
]

shared_vpc_network_users = [
  {
    member     = "serviceAccount:351680271643@cloudservices.gserviceaccount.com"
    subnetwork = "shared-test-us-central1"
    region     = "us-central1"
  },
]

vpcs = {
  dh-dev-vpc = {
    description = "Shared test VPC for prj-shared-network-test-513109."
    subnets = {
      shared-test-us-central1 = {
        region                   = "us-central1"
        ip_cidr_range            = "10.10.0.0/24"
        description              = "Primary subnet for dh-dev-vpc."
        private_ip_google_access = true
      }
      shared-test-us-east1 = {
        region                   = "us-east1"
        ip_cidr_range            = "10.10.1.0/24"
        description              = "us-east1 subnet for dh-dev-vpc."
        private_ip_google_access = true
      }
    }
  }

  dh-dev2-vpc = {
    description = "Second VPC."
    subnets = {
      second-us-central1 = {
        region                   = "us-central1"
        ip_cidr_range            = "10.20.0.0/24"
        description              = "Primary subnet for dh-dev2-vpc."
        private_ip_google_access = true
      }
      second-us-east1 = {
        region                   = "us-east1"
        ip_cidr_range            = "10.20.1.0/24"
        description              = "us-east1 subnet for dh-dev2-vpc."
        private_ip_google_access = true
      }
    }
  }
}
