resource "azurerm_virtual_network" "example" {
    for_each = value.vnets

    name = each.value.name
    location = each.value.location
    managed_by = each.value_managed_by

}
    
     
resource "azurerm_resource_group" "vnet" {
  for_each = var.vnets

}

  resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}