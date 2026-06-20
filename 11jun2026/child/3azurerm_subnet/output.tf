output "subnet_ids" {
    value = {
        for k, v in azurerm_subnet.subnetblock : k=> v.id
    }
}
