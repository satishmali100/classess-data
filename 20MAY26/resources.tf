resource "azurerm_resource_group" "block1" {

  for_each = {
    dev = {
      location = "eastus"
    }

    uat = {
      location = "westus"
    }
  }

  name     = each.key
  location = each.value.location
}

resource "azurerm_storage_account" "block2" {

  for_each = {
    dev = {
      name        = "satishstordev0101"
      replication = "LRS"
    }

    uat = {
      name        = "satishstoruat0101"
      replication = "GRS"
    }
  }

  name                     = each.value.name
  resource_group_name      = azurerm_resource_group.block1[each.key].name
  location                 = azurerm_resource_group.block1[each.key].location
  account_tier             = "Standard"
  account_replication_type = each.value.replication
}

resource "azurerm_storage_container" "block3" {

  for_each = azurerm_storage_account.block2

  name                  = "satishcontainer"
  storage_account_name  = each.value.name
  container_access_type = "private"
}