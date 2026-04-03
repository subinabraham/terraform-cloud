############################################################
# Variables
############################################################
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}


variable "google_credentials" {
  description = "GCP service account JSON key for Terraform Cloud"
  type        = string
  sensitive   = true
}