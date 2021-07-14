# terraform-auth0-manage-domains

This repo acts as a terraform module as well as terraform invocation project to provision and configure auth0 for saml.
As of now its used to show how we can set up saml in aws sso for single signon.

# TODO

* Dropping the idea of module, AWS does not have support for various data lookups, and we might have to revisit it. The
  idea would be to have a python script to discover values.
