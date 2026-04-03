terraform {
    cloud {
          organization = "wm-coned"

              workspaces {
                      name = "cli-wk"
              }
    }

      required_version = ">= 1.5.0"
        required_providers {
              random = {
                      source  = "hashicorp/random"
                            version = "~> 3.6"
              }
        }
}

provider "random" {}

resource "random_string" "example" {
    length  = 8
      upper   = true
        lower   = true
          numeric = true
            special = false
}

output "token" {
    value     = random_string.example.result
      sensitive = true
}