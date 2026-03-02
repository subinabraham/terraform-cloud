
############################################################
# BigQuery Dataset
############################################################
resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.dataset_id
  location                    = "US"
  description                 = "Example dataset created with Terraform"
  delete_contents_on_destroy  = true

  labels = {
    environment = "dev"
    owner       = "subinabraham"
    org         = "coned"
    


  }
}

############################################################
# BigQuery Table
############################################################
resource "google_bigquery_table" "table" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = var.table_id

  schema = jsonencode([
    {
      name = "id"
      type = "STRING"
      mode = "REQUIRED"
    },
    {
      name = "timestamp"
      type = "TIMESTAMP"
      mode = "REQUIRED"
    },
    {
      name = "value"
      type = "FLOAT"
      mode = "NULLABLE"
    }
  ])

  labels = {
    environment = "dev"
    owner       = "terraform"
  }
}