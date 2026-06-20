output "pubip_ids" {
    value = {
        for k, v in azurerm_public_ip.pubblock : k=> v.id
    }
  
}

