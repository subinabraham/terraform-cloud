resource "google_bigquery_dataset" "this" {
  project    = var.project_id
  dataset_id = var.dataset_id
  location   = var.location

  friendly_name              = var.friendly_name
  description                = var.description
  labels                     = var.labels
  resource_tags              = var.resource_tags
  delete_contents_on_destroy = var.delete_contents_on_destroy

  # Hygiene defaults
  #default_table_expiration_ms     = var.default_table_expiration_ms
  default_partition_expiration_ms = var.default_partition_expiration_ms

  # Advanced tuning
  max_time_travel_hours = var.max_time_travel_hours        # e.g., 168 for 7 days
  storage_billing_model = var.storage_billing_model        # LOGICAL or PHYSICAL (Enterprise)

  # Default CMEK (optional)
  dynamic "default_encryption_configuration" {
    for_each = var.encryption_key == null ? [] : [var.encryption_key]
    content {
      kms_key_name = var.encryption_key
    }
  }
}