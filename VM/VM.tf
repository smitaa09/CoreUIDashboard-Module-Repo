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

resource "azurerm_virtual_network" "vnet" {
  name                = "ANI_Digital_Labvnet921"
  address_space       = ["10.0.2.0/24"]
  location            = "eastus"
  resource_group_name = "ANI_Digital_Lab"
}

resource "azurerm_subnet" "subnet" {
  name                 = "default"
  resource_group_name  = "ANI_Digital_Lab"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_network_interface" "nic" {
  name                = "TestVM01-nic"
  location            = "eastus"
  resource_group_name = "rg-ani-c-001"

  ip_configuration {
    name                          = "TestVM01-config"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "virtualmachine" {  
  name                  = "TestVM01"
  location              = "eastus"
  resource_group_name   = "rg-ani-c-001"
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  storage_os_disk {
    name              = "TestVM01-OsDisk"
    os_type           = "Windows"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = "32" 
  }
  os_profile {
    computer_name  = "TestVM01"
    admin_username = "cloudadmin"
    admin_password = "password@123"
  }
  os_profile_windows_config {    
    provision_vm_agent        = "true"
    enable_automatic_upgrades = "true"
  }

}
