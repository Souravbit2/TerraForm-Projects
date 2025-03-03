terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.2" # Specify the version you need
    }
  }
}
# Configure the Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.az_subscription_id
}

# Resource Group cant be created in this because Microsoft Learn Sandbox doesn't allow to do so.
/*
# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.az_storage_account_rg_name
  location = var.az_location
}
*/
resource "azurerm_virtual_network" "myVnet"{
  resource_group_name=var.az_resource_group_name
  name=var.az_virtualnetwork_name
  address_space=["10.0.0.1/16"]
  location=
}



# Storage Account
resource "azurerm_storage_account" "sa" {
  name                     = var.az_storage_account_name
  resource_group_name      = var.az_storage_account_rg_name
  location                 = var.az_location
  account_tier             = var.az_storage_account_type
  account_replication_type = var.az_storage_account_replication_type

  tags = {
    environment = "az_sa_mslearn"
  }
}

# Storage Container
resource "azurerm_storage_container" "container" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = var.az_container_access_type
}
#sdafsdf