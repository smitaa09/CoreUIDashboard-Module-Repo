# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.61.0"
      
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

resource "azurerm_storage_account" "sa" {
  name                     = "testsa01"
  resource_group_name      = "rg-ani-c-001"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
