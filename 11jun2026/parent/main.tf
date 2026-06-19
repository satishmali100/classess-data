module "rg" {
  source = "../child/1azurerm_resource_group"

  rgs = var.rgs
}

module "vnet" {
  source = "../child/2azurerm_virtual_network"

  vns = var.vns
}

module "subnet" {
  source = "../child/3azurerm_subnet"

  snc = var.snc

}

module "pip" {
  source = "../child/4azurerm_public_ip"
  pip    = var.pip
}

module "nic" {
  source = "../child/5azurerm_nic"
  nic = {
    for k, v in var.nic : k => merge(v, {
      subnet_id    = module.subnet.subnet_ids[v.subnet_key]
      public_ip_id = module.pip.pubip_ids[v.public_ip_key]

    })
  }
}
module "nsgs" {
  source = "../child/7azurerm_nsg"
  nsgs   = var.nsgs
}

module "vms" {
  source = "../child/9azurerm_virtual_machine"

  vms = {
    for k, v in var.vms :
    k => merge(v, {
      nid = [
        module.nic.nic_ids[v.nic1]
      ]
    })
  }
}


