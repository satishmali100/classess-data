resource "azurerm_resource_group" "block1" {
    for_each = toset(["foo", "bar", "baz"])
    name=each.key
    location= "westus""
}