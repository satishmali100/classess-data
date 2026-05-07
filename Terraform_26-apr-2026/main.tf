terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
 }
terraform {}

provider "azurerm" {
  
  # Configuration options
  features {
  }
}


resource "azurerm_resource_group" "test-vnet" {
  name     = vnet.test
   location = "West Europe"
}

