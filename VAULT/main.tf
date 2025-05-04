data "vault_generic_secret" "secret_key" {
  path = "secret/app"
}

output "secret_key" {
  value     = data.vault_generic_secret.secret_key.data["secret_key"]
  sensitive = true
}
