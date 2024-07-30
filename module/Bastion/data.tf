data "azurerm_resource_group" "datarg" {
  name = "new-rg"
}

data "azurerm_subnet" "datasubnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "new-vnet"
  resource_group_name  = data.azurerm_resource_group.datarg.name
}

data "azurerm_public_ip" "datapip" {
  name                = "bastion-pip"
  resource_group_name = data.azurerm_resource_group.datarg.name
}