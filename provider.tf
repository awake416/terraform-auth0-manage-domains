variable region {
  type = string
  default = "us-east-1"
}

variable shared_cred_file {
  type = string
  default = ""
}

provider auth0 {
}
provider aws {
  region = var.region
}