data "azurerm_resource_group" "datarg" {
    name="new-rg"
  
}
data "azurerm_virtual_network" "datavnet" {
  
  name                = "new-vnet"
  resource_group_name = data.azurerm_resource_group.datarg.name
}
