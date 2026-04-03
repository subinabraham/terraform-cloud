terraform {
  cloud {
    organization = "wm-coned"

    workspaces {
      name = "cli-wk"
    }
  }

  required_version = "~> 1.14.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  credentials = var.google_credentials
}