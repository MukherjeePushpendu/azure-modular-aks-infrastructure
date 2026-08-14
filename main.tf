# 1. Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-enterprise-demo"
  location = "East US"
}

# 2. Random String for unique naming
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# 3. Module 1: Service Principal
module "aks_spn" {
  source   = "./modules/spn"
  spn_name = "spn-aks-cluster-admin"
}

# 4. Module 2: Key Vault (Consumes SPN outputs)
module "keyvault" {
  source              = "./modules/keyvault"
  keyvault_name       = "kvaks${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  spn_client_id       = module.aks_spn.client_id
  spn_client_secret   = module.aks_spn.client_secret
}

# 5. Module 3: AKS Cluster (Consumes SPN credentials & deploys cluster)
module "aks_cluster" {
  source              = "./modules/aks"
  cluster_name        = "aks-cluster-${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aksdns-${random_string.suffix.result}"
  node_count          = 1
  vm_size             = "Standard_B2s"
  client_id           = module.aks_spn.client_id
  client_secret       = module.aks_spn.client_secret

  depends_on = [
    module.aks_spn,
    module.keyvault
  ]
}