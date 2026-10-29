terraform {
  required_version = ">= 1.5.0"

  backend "gcs" {
    bucket = "df-state-files"
    prefix = "environments/prj-shared-network-test/compute"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}
