resource auth0_prompt login_prompt {
  universal_login_experience = "new"
}

resource auth0_branding homeLab {
  logo_url = var.logo_uri
  colors {
    primary         = "#0059d6"
    page_background = "#000000"
  }
}

resource auth0_client aws_console_login_sso {
  name                                = "aws_console_login_sso"
  description                         = "This client is used to login to aws console via aws sso. SSO is setup in aws org account"
  app_type                            = "regular_web"
  logo_uri                            = var.logo_uri
  custom_login_page_on                = true
  is_first_party                      = true
  is_token_endpoint_ip_header_trusted = true
  token_endpoint_auth_method          = var.token_endpoint_auth_method
  oidc_conformant                     = false
  callbacks                           = [
    var.aws_sso_acs_url]
  allowed_origins                     = [
    var.allowed_origins]
  allowed_logout_urls                 = [
    var.allowed_logout_urls]
  web_origins                         = [
    var.web_origins]
  addons {
    samlp {
      audience                           = var.aws_sso_issuer
      destination                        = var.aws_sso_acs_url
      mappings                           = var.saml_mappings
      create_upn_claim                   = false
      passthrough_claims_with_no_mapping = false
      map_unknown_claims_as_is           = false
      map_identities                     = false
      name_identifier_format             = var.name_ident_format
      name_identifier_probes             = var.name_ident_probes
    }
  }
}

resource auth0_rule aws_role_assignment {
  name    = "aws-role-assignment"
  script  = templatefile("${path.module}/aws_role_assignment.js", {
    account_id = data.aws_caller_identity.current.account_id
  })
  enabled = true
}
