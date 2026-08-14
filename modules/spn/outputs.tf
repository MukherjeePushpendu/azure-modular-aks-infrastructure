output "client_id" {
  description = "The Client (Application) ID of the Service Principal"
  value       = azuread_application.aks_app.client_id
}

output "client_secret" {
  description = "The Client Secret value"
  value       = azuread_service_principal_password.aks_spn_secret.value
  sensitive   = true
}

output "object_id" {
  description = "The Object ID of the Service Principal"
  value       = azuread_service_principal.aks_spn.object_id
}
