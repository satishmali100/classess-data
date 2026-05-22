resource "azurerm_resource_group" "block1" {

  for_each = var.rgs

  name     = each.value.rg_name
  location = each.value.location


  tags = each.value.tags

}

resource "azurerm_storage_account" "block2" {
  for_each = var.storage_accounts

  name                     = each.value.storage_name
  resource_group_name      = azurerm_resource_group.block1[each.value.rg_key].name
  location                 = azurerm_resource_group.block1[each.value.rg_key].location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.replication

  tags = each.value.tags
}

resource "azurerm_storage_container" "block3" {
  for_each = var.storage_containers

  name                 = each.value.container_name
  storage_account_id   = azurerm_storage_account.block2[each.value.storage_key].id
  container_access_type = each.value.access_type
}