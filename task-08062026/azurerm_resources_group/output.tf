output "resource_group_names" {
  value = {
    for k, v in azurerm_resource_group.rgblock : k => {
      name     = v.name
      location = v.location
      tags     = v.tags
    }
  }
}