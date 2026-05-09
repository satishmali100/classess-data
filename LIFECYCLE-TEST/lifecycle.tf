terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  # Configuration options
}


resource "azurerm_resource_group" "block1" {
  name     = "lifecycletest"
  location = "Westus"
}

resource "azurerm_storage_account" "block2" {
  name                     = "storagesatish"
  resource_group_name      = azurerm_resource_group.block1.name
 location                 = azurerm_resource_group.block1.location
account_tier             = "Standard"
 account_replication_type = "GRS"

}

resource "azurerm_storage_container" "block3"{
name = "storagecontainersatish"
storage_account_id = azurerm_storage_account.block2.id
container_access_type = "private"
}

