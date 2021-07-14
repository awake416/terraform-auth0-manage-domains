terraform {
  backend remote {
    organization = "awake416"

    workspaces {
      prefix = "terraform-auth0-manage-domains-"
    }
  }
  required_providers {
    auth0 = {
      source  = "alexkappa/auth0"
      version = "0.21.0"
    }
  }
  required_version = ">= 0.13.0"
}
