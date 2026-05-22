variable "rgs" {}
  

variable "storage_accounts" {
  type = map(object({
    storage_name = string
    rg_key       = string
    account_tier = string
    replication  = string
    tags         = map(string)
  }))
}

variable "storage_containers" {
  type = map(object({
    container_name = string
    storage_key    = string
    access_type    = string
  }))
}