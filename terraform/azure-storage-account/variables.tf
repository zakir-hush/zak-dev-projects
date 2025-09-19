variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  # default     = "default-rg"  
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "East US"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account (must be globally unique)"
}

variable "container_name" {
  type        = string
  description = "Name of the blob container"
  # default     = "example-container"
}
