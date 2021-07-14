variable "logo_uri" {
  default = "https://cdn.auth0.com/manhattan/versions/1.3164.0/assets/./badge.png"
}

variable "token_endpoint_auth_method" {
  default     = "client_secret_post"
  description = "Defines the requested authentication method for the token endpoint - none|client_secret_post|client_secret_basic"
}

variable "aws_sso_acs_url" {}
variable "aws_sso_issuer" {}

variable "allowed_origins" {
  default = null
}
variable "allowed_logout_urls" {
  default = null
}
variable "web_origins" {
  default = null
}

variable "saml_mappings" {
  default = {
    email = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"
    name  = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
  }
}

variable "name_ident_format" {
  default = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
}

variable "name_ident_probes" {
  default = ["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"]
}

variable AUTH0_DOMAIN {}
variable AUTH0_CLIENT_ID {}
variable AUTH0_CLIENT_SECRET {}
variable AWS_ACCESS_KEY_ID {}
variable AWS_SECRET_ACCESS_KEY {}
variable env {}
data aws_caller_identity current {}
