resource "azurerm_resource_group" "This" {
  name = var.name
  location = var.location
  tags = var.tags
}

