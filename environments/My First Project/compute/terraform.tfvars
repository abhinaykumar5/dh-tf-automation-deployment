project_id = "project-03ca8a54-2170-4c4e-8b7"
region     = "us-central1"

compute = {
  dh-dev-compute = {
    machine_type       = "e2-micro"
    zone               = "us-central1-a"
    tags               = ["dh-dev-compute"]
    network            = "projects/prj-shared-network-test-513109/global/networks/dh-dev-vpc"
    subnetwork         = "projects/prj-shared-network-test-513109/regions/us-central1/subnetworks/shared-test-us-central1"
    subnetwork_project = "prj-shared-network-test-513109"
    disk_name          = "dh-dev-compute-data"
    disk_size          = 10
    disk_type          = "pd-balanced"
  }
}

