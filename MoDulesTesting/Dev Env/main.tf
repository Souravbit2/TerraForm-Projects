# Example Root Module (using the VNet module)

# environments/dev/main.tf

module "dev_vnet" {
  source              = "../../modules/vnet"
  resource_group_name = "dev-rg"
  location            = "East US"
  vnet_name           = "dev-vnet"
  address_space       = ["10.1.0.0/16"]
  subnet_name         = "dev-subnet"
  subnet_prefixes     = ["10.1.1.0/24"]
  tags = {
    Environment = "dev"
    Project     = "MyApp"
  }
}

output "dev_vnet_id" {
  value = module.dev_vnet.vnet_id
}

output "dev_subnet_id" {
  value = module.dev_vnet.subnet_id
}

# environments/dev/providers.tf
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Pin the version
    }
  }
}

provider "azurerm" {
  features {}
}
