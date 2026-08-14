output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.kv.id
}

output "key_vault_uri" {
  description = "The URI of the Key Vault"
  value       = azurerm_key_vault.kv.vault_uri
}

output "spn_client_id_secret_name" {
  description = "Secret name for SPN Client ID"
  value       = azurerm_key_vault_secret.spn_client_id_secret.name
}

output "spn_client_secret_secret_name" {
  description = "Secret name for SPN Client Secret"
  value       = azurerm_key_vault_secret.spn_client_secret_secret.name
}