variable env {}
variable oauth_token_id {}

variable aws_access_key_id {}
variable aws_secret_access_key {}
variable aws_sso_acs_url {}
variable aws_sso_issuer {}

variable auth0_domain {}
variable auth0_client_id {}
variable auth0_client_secret {}

module manage_workspaces {
  source  = "app.terraform.io/awake416/manage_workspaces/tfe"
  version = "0.0.5"

  env                   = var.env
  prefix                = "terraform-auth0-manage-domains"
  oauth_token_id        = var.oauth_token_id
  aws_access_key_id     = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
}

resource tfe_variable auth0_domain {
  key          = "AUTH0_DOMAIN"
  value        = var.auth0_domain
  category     = "terraform"
  description  = "Domain for auth0"
  workspace_id = module.manage_workspaces.workspace_id
}

resource tfe_variable auth0_client_id {
  key          = "AUTH0_CLIENT_ID"
  value        = var.auth0_client_id
  category     = "terraform"
  description  = "auth0 client id"
  workspace_id = module.manage_workspaces.workspace_id
  sensitive    = true
}

resource tfe_variable auth0_client_secret {
  key          = "AUTH0_CLIENT_SECRET"
  value        = var.auth0_client_secret
  category     = "terraform"
  description  = "auth0 client secret"
  workspace_id = module.manage_workspaces.workspace_id
  sensitive    = true
}

resource tfe_variable aws_sso_acs_url {
  key          = "aws_sso_acs_url"
  value        = var.aws_sso_acs_url
  category     = "terraform"
  description  = "aws sso acs url"
  workspace_id = module.manage_workspaces.workspace_id
}

resource tfe_variable aws_sso_issuer {
  key          = "aws_sso_issuer"
  value        = var.aws_sso_issuer
  category     = "terraform"
  description  = "aws sso issuer"
  workspace_id = module.manage_workspaces.workspace_id
}

