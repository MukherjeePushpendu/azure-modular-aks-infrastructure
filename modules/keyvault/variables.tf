variable "keyvault_name" {
  type        = string
  description = "Name of the Key Vault (must be globally unique, 3-24 alphanumeric characters)"
}

variable "location" {
  type        = string
  description = "Azure Region for Key Vault"
}

variable "resource_group_name" {
  type        = string
  description = "Target Resource Group Name"
}

variable "spn_client_id" {
  type        = string
  description = "SPN Client ID to store as a secret"
}

variable "spn_client_secret" {
  type        = string
  description = "SPN Client Secret to store as a secret"
  sensitive   = true
}