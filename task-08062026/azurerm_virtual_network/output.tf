output "azurerm_virtual_network" {
value = {
  for k ,v in azurerm_virtual_network.vnsblock : k=> {
  name = v.name
  location = v.location
  resource_group_name = v.resource_group_name
  address_space = v.address_space
  tags = v.tags
  }
}
}

