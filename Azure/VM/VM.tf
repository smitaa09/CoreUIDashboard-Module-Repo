provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

# refer to a existing vnet
data "azurerm_virtual_network" "virtualnetwork" {
  name                  = "ANI_Digital_Labvnet921"  
  resource_group_name   = "ANI_Digital_Lab"
}
# refere to existing subnet
data "azurerm_subnet" "subnet" {
  name                 = "default"
  resource_group_name  = "${data.azurerm_virtual_network.virtualnetwork.resource_group_name}"
  virtual_network_name = "${data.azurerm_virtual_network.virtualnetwork.name}" 
}
# refere to existing nsg provided nsg is in vNet Resource group
data "azurerm_network_security_group" "nsg" {
  name                 = "UIDevVM-nsg"
  resource_group_name  = "${data.azurerm_virtual_network.virtualnetwork.resource_group_name}"
}

resource "azurerm_network_interface" "nic" {
  name                = "TestVM01-nic"
  location            = "eastus"
  resource_group_name = "rg-ani-c-001"

  ip_configuration {
    name                          = "TestVM01-config"
    subnet_id                     = "${data.azurerm_subnet.subnet.id}"
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
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "TestVM01-osDisk01"
    os_type           = "Linux"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = "128" 
  }
  os_profile {
    computer_name  = "TestVM01"
    admin_username = "cloludadmin"
    admin_password = "Password@123"
  }  
  os_profile_linux_config {
    disable_password_authentication = false
  }
}