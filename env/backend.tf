terraform {
  backend remote {
    hostname     = "app.terraform.io"
    organization = "awake416"

    workspaces {
      name = "manage_auth0_baseline_workspace_setup"
    }
  }
}

provider tfe {}