terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "test-satish"
    storage_account_name = "satishteststoragetest" # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "satishcontainer"       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "satish.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}


provider "azurerm" {
  # Configuration options
  features {
  }
}

resource "azurerm_resource_group" "test-satish" {
  name     = "test-satish"
  location = "West Europe"
}

resource "azurerm_storage_account" "satish-storage" {
  name                     = "satishteststoragetest"
  resource_group_name      = azurerm_resource_group.test-satish.name
  location                 = azurerm_resource_group.test-satish.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "satishcontainer" {
  name                  = "satishcontainer"
  storage_account_name  = "satishteststoragetest" # hardcoded → no implicit dependency
  container_access_type = "private"

  depends_on = [
  azurerm_storage_account.satish-storage]
}


