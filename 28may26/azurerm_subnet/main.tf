resource "azurerm_subnet" "example" {
    for_each = var.subnets

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value_virtual_network_name
  address_prefixes     = each_value_address_prefixes
}