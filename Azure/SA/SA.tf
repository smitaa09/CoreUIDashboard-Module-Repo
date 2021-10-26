provider "azurerm" {
  skip_provider_registration = "true"
  features {}

}

resource "azurerm_storage_account" "sa" {
  name                     = "cmpsa01"
  resource_group_name      = "rg-ani-c-001"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
