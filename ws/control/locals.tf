locals {
  common_tags = {
    unit      = var.unit
    service   = var.service
    contact   = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
  prefix = {
    ig = "ig"
    vpc="vpc"
    bu=var.service
    env = var.enviroment
    }
}