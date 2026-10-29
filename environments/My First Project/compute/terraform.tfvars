project_id = "project-03ca8a54-2170-4c4e-8b7"
region     = "us-central1"

compute = {
  dh-dev-compute = {
    machine_type = "e2-micro"
    zone         = "us-central1-b"
    tags         = ["dh-dev-compute"]
    network      = "default"
    subnetwork   = "default"
    disk_name    = "dh-dev-compute-data"
    disk_size    = 10
    disk_type    = "pd-balanced"
  }
}