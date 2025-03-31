resource "google_storage_bucket" "backup" {
  name          = var.gcp_bucket_name
  location      = var.gcp_region
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

variable "gcp_project" {}
variable "gcp_region" {}
variable "gcp_bucket_name" {}

output "gcp_bucket_url" {
  value = google_storage_bucket.backup.url
}
