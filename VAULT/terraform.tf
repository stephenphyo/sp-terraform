terraform {
  required_version = ">= 1.0.0"
}

provider "vault" {
  address = "http://192.168.1.141:8200"
  # Set VAULT_TOKEN in Environment Variable
}
