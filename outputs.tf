output "resource_group_name" {
  description = "Resource Group containing all deployed infrastructure"
  value       = azurerm_resource_group.rg.name
}

output "spn_client_id" {
  description = "Generated SPN Client ID"
  value       = module.aks_spn.client_id
}

output "key_vault_name" {
  description = "Name of the created Key Vault"
  value       = "kvaks${random_string.suffix.result}"
}

output "key_vault_uri" {
  description = "URI endpoint for Azure Key Vault"
  value       = module.keyvault.key_vault_uri
}

output "aks_cluster_name" {
  description = "Name of the provisioned AKS cluster"
  value       = module.aks_cluster.cluster_name
}

output "aks_connect_command" {
  description = "Run this Azure CLI command to fetch kubeconfig credentials"
  value       = "az aks get-credentials --resource-group ${azurerm_resource_group.rg.name} --name ${module.aks_cluster.cluster_name}"
}
