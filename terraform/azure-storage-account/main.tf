terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }

  # required_version = ">=1.1.0"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "my_rg" {  // my_rg is not keyword or a value ref, its just a label
  name     = var.resource_group_name        // var. calls the value from tfvars
  location = var.location
}

resource "azurerm_storage_account" "my_storage" {    // label
  name                     = var.storage_account_name        // calling value from tfvars
  resource_group_name      = azurerm_resource_group.my_rg.name
  location                 = azurerm_resource_group.my_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Dev"
  }
}

# Optional: Create a container
resource "azurerm_storage_container" "my_container" {   // label name
  name                  = var.container_name            // calling container name value
  storage_account_name  = azurerm_storage_account.my_storage.name
  container_access_type = "private"
}
