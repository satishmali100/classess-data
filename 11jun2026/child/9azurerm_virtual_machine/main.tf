resource "azurerm_virtual_machine" "vmblock" {

  for_each              = var.vms

  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.rgn
  network_interface_ids = each.value.nid
  vm_size               = each.value.vm_size

  storage_image_reference {
    publisher = each.value.sir.publisher
    offer     = each.value.sir.offer
    sku       = each.value.sir.sku
    version   = each.value.sir.version
   }

  storage_os_disk {
    name              = each.value.sod.name
    caching           = each.value.sod.caching
    create_option     = each.value.sod.create_option
    managed_disk_type = each.value.sod.managed_disk_type

  }
  os_profile {
    computer_name  = each.value.op.computer_name
    admin_username = each.value.op.admin_username
    admin_password = each.value.op.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = each.value.oplc.disable_password_authentication
  }

}