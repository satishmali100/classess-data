## For eash + list Way
resource "azurerm_resource_group" "block1" {
  name     = "satishtest"
  location = "westus"
}

resource "azurerm_resource_group" "block2" {
  name     = var.s
  location = var.location
}

resource "azurerm_resource_group" "block3" {
  for_each = toset(["dev", "prod", "test"])
  name     = each.value
  location = "westus"
}

resource "azurerm_resource_group" "block4" {
  for_each = toset(var.multiple)
  name     = each.value
  location = "westus"
}

resource "azurerm_resource_group" "block5" {
  for_each = { "devc" = "westus", "prodc" = "eastus" }
  name     = each.key
  location = each.value
}

resource "azurerm_resource_group" "block6" {
  for_each = (var.map)
  name     = each.key
  location = each.value
}

