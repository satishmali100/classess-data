module "dev_rg" {
source = "./modules/resource_group"

name = "module-dev-rg"
location = "West Europe"

tags = {
    environment = "dev"
    owner = "satish"
    }
}