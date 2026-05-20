# resource "azurerm_resource_group" "block1" {
#   name     = var.s2
#   location = var.location
#   tags     = var.tags
# }



# resource "azurerm_storage_account" "block2" {
#   name                     = "satishstoragelab0101"
#   resource_group_name      = azurerm_resource_group.block1.name
#   location                 = azurerm_resource_group.block1.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   tags                     = var.tags
# }

### for each - toset##

# resource "azurerm_resource_group" "block3" {
#   for_each = var.foreachname
#   name     = each.value
#   location = each.value
# }

# resource "azurerm_storage_container" "block4" {
#   name                  = "satishcontainer"
#   storage_account_name    = azurerm_storage_account.block2.name
#   container_access_type = "private"

# }


resource "azurerm_resource_group" "rg" {

  for_each = var.infra

  name     = each.key
  location = each.value.location
}

resource "azurerm_storage_account" "sa" {

  for_each = var.infra

  name                     = each.value.storage_name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  account_tier             = "Standard"
  account_replication_type = each.value.replication_type
}

resource "azurerm_storage_container" "container" {

  for_each = var.infra

  name                  = each.value.container_name
  storage_account_name  = azurerm_storage_account.sa[each.key].name
  container_access_type = "private"
}
