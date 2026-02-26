############################################################
# Variables
############################################################
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}


variable "credentials_json" {
  type = string
}


variable "region" {
  description = "The default region for resources"
  type        = string
  default     = "US"
}

variable "dataset_id" {
  description = "BigQuery dataset ID"
  type        = string
  default     = "my_dataset"
}

variable "table_id" {
  description = "BigQuery table ID"
  type        = string
  default     = "my_table"
}
 