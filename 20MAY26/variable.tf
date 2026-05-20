# variable "s2" {}

# variable "location" {}

# variable "tags" {
#   description = "common tags"
#   default = {
#     envouirement = "lab"
#     owner        = "satish"
#   }
# }

# variable "foreachname" {}


variable "infra" {

  default = {

    dev = {
      location          = "eastus"
      storage_name      = "satishstordev0101"
      replication_type  = "LRS"
      container_name    = "devcontainer"
    }

    uat = {
      location          = "westus"
      storage_name      = "satishstoruat0101"
      replication_type  = "GRS"
      container_name    = "uatcontainer"
    }
  }
}




