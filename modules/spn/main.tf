# 1. Create Azure AD Application
resource "azuread_application" "aks_app" {
  display_name = var.spn_name
}

# 2. Create Service Principal for the App
resource "azuread_service_principal" "aks_spn" {
  client_id = azuread_application.aks_app.client_id
}

# 3. Create a Password/Secret for the Service Principal
resource "azuread_service_principal_password" "aks_spn_secret" {
  service_principal_id = azuread_service_principal.aks_spn.id
  end_date             = "2028-01-01T00:00:00Z"
}