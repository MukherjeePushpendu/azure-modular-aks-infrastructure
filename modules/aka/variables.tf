variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
}

variable "location" {
  type        = string
  description = "Azure Region for AKS"
}

variable "resource_group_name" {
  type        = string
  description = "Target Resource Group Name"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix specified when creating the managed cluster"
}

variable "node_count" {
  type        = number
  description = "Initial number of worker nodes in the default node pool"
  default     = 1
}

variable "vm_size" {
  type        = string
  description = "Azure VM SKU size for worker nodes"
  default     = "Standard_B2s"
}

variable "client_id" {
  type        = string
  description = "The Client ID of the Service Principal"
}

variable "client_secret" {
  type        = string
  description = "The Client Secret of the Service Principal"
  sensitive   = true
}