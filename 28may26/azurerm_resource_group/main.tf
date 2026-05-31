resource "azurerm_resource_group" "block1" {
  for_each = var.rgs

  name       = each.value.name
  location   = each.value.location
  managed_by = each.value_managed_by
  tags = each.value.tags
  

}