resource "google_compute_instance" "this" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags

  boot_disk {
    initialize_params {
      image = var.boot_image
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }
}

resource "google_compute_disk" "this" {
  name = var.disk_name
  size = var.disk_size
  type = var.disk_type
  zone = var.disk_zone
}

resource "google_compute_attached_disk" "this" {
  disk     = google_compute_disk.this.id
  instance = google_compute_instance.this.id
}