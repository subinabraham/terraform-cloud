locals {
  domains = ["sc"]
}

# RAW datasets
module "raw" {
  for_each   = toset(local.domains)
  source     = "../../modules/bigquery"
  project_id = var.project_id
  dataset_id = "${each.value}_raw"
  location   = "US"

  friendly_name = "${title(each.value)} Raw"
  description   = "Raw ingestion layer for ${each.value} (dev)"
  labels        = { env = "dev", layer = "raw", owner = each.value }

  #default_table_expiration_ms     = 0
  default_partition_expiration_ms = null
  max_time_travel_hours           = 168
  storage_billing_model           = "LOGICAL"
  encryption_key                  = null
  delete_contents_on_destroy      = false
}

# STAGING datasets
module "staging" {
  for_each   = toset(local.domains)
  source     = "../../modules/bigquery"
  project_id = var.project_id
  dataset_id = "${each.value}_staging"
  location   = "US"

  friendly_name = "${title(each.value)} Staging"
  description   = "Staging layer for ${each.value} (dev)"
  labels        = { env = "dev", layer = "staging", owner = each.value }

  #default_table_expiration_ms     = 604800000 # 7 days
  default_partition_expiration_ms = null
  max_time_travel_hours           = 168
  storage_billing_model           = "LOGICAL"
  encryption_key                  = null
}

# CURATED datasets
module "curated" {
  for_each   = toset(local.domains)
  source     = "../../modules/bigquery"
  project_id = var.project_id
  dataset_id = "${each.value}_curated"
  location   = "US"

  friendly_name = "${title(each.value)} Curated"
  description   = "Curated (gold) layer for ${each.value} (dev)"
  labels        = { env = "dev", layer = "curated", owner = each.value }

  #default_table_expiration_ms     = 0
  default_partition_expiration_ms = null
  max_time_travel_hours           = 168
  storage_billing_model           = "LOGICAL"
  encryption_key                  = null
}
