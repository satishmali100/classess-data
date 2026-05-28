resource "azurerm_resource_group" "blick1" {
name = var.each.value
location = var.each.location

}