variable "project_id" {
  description = "GCP project ID where the dataset is created."
  type        = string
}

variable "dataset_id" {
  description = "Dataset ID (e.g., sales_raw)."
  type        = string
}

variable "location" {
  description = "Dataset location (e.g., US)."
  type        = string
}

variable "friendly_name" {
  description = "Human-friendly dataset name."
  type        = string
  default     = null
}

variable "description" {
  description = "Dataset description."
  type        = string
  default     = null
}

variable "labels" {
  description = "Key/value labels."
  type        = map(string)
  default     = {}
}

variable "resource_tags" {
  description = "Resource tags (project-scoped key/value tags)."
  type        = map(string)
  default     = {}
}

variable "delete_contents_on_destroy" {
  description = "If true, delete tables/views when destroying the dataset."
  type        = bool
  default     = false
}
/*
variable "default_table_expiration_ms" {
  description = "Default expiration for tables (ms). Null or 0 = never."
  type        = number
  default     = null
}
*/
variable "default_partition_expiration_ms" {
  description = "Default expiration for partitions in partitioned tables (ms)."
  type        = number
  default     = null
}

variable "max_time_travel_hours" {
  description = "Time travel window in hours (e.g., 168 for 7 days)."
  type        = number
  default     = null
}

variable "storage_billing_model" {
  description = "Storage billing: LOGICAL (default) or PHYSICAL (Enterprise feature)."
  type        = string
  default     = null
  validation {
    condition     = var.storage_billing_model == null || contains(["LOGICAL", "PHYSICAL"], var.storage_billing_model)
    error_message = "storage_billing_model must be null, LOGICAL, or PHYSICAL."
  }
}

variable "encryption_key" {
  description = "CMEK key name (projects/.../locations/.../keyRings/.../cryptoKeys/...). Null for Google-managed."
  type        = string
  default     = null
}
