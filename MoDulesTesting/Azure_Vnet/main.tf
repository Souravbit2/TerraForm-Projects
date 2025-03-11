# Example Azure Terraform Module: Virtual Network (VNet)

# /workspaces/TerraForm-Projects/TerraForm-Projects/MoDulesTesting/Azure_Vnet/main.tf
#Since MS learn Sandbox doesn't allow to create resource group , commenting out the below resource block for rg creation. We'll straight away pass the value.
/*resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}*/

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_prefixes
}



