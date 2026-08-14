# 1. Fetch current client configuration for tenant ID and logged-in user object ID
data "azurerm_client_config" "current" {}

# 2. Deploy Azure Key Vault
resource "azurerm_key_vault" "kv" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"

  # Access Policy for logged-in user (Terraform runner) to write secrets
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Purge", "Recover"
    ]
  }
}

# 3. Store SPN Client ID as a Key Vault Secret
resource "azurerm_key_vault_secret" "spn_client_id_secret" {
  name         = "spn-client-id"
  value        = var.spn_client_id
  key_vault_id = azurerm_key_vault.kv.id
}

# 4. Store SPN Client Secret as a Key Vault Secret
resource "azurerm_key_vault_secret" "spn_client_secret_secret" {
  name         = "spn-client-secret"
  value        = var.spn_client_secret
  key_vault_id = azurerm_key_vault.kv.id
}