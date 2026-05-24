variable "resource_group_name" {
  default = "rg-aks-lab"
}

variable "location" {
  default = "westus"
}


variable "aks_name" {
  default = "aks-satish-lab"
}

variable "node_count" {
  default = 1
}

variable "vm_size" {
  default = "Standard_D2s_v3"

}
