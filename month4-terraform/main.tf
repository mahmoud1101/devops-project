terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "a16da2d6-3886-42f4-ab6f-34021cdd64e0"
}

resource "azurerm_resource_group" "devops_rg" {
  name     = "mahmoud-devops-rg"
  location = "eastus"

  tags = {
    project     = "devops-learning"
    owner       = "mahmoud"
    month       = "month4-terraform"
  }
}

resource "azurerm_virtual_network" "devops_vnet" {
  name                = "mahmoud-devops-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.devops_rg.location
  resource_group_name = azurerm_resource_group.devops_rg.name

  tags = {
    project = "devops-learning"
    owner   = "mahmoud"
  }
}

resource "azurerm_subnet" "devops_subnet" {
  name                 = "mahmoud-devops-subnet"
  resource_group_name  = azurerm_resource_group.devops_rg.name
  virtual_network_name = azurerm_virtual_network.devops_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
