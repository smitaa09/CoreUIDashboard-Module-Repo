provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "sa" {
  name                     = "testsa01"
  resource_group_name      = "ANI_Digital_Lab"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
