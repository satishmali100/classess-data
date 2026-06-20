output "nic_ids" {
    value = {
        for k, v in azurerm_network_interface.nicblock : k=> v.id
    }
  
}