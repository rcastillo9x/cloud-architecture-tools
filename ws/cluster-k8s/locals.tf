locals {
  common_tags = {
    unit       = var.unit
    service    = var.service
    contact    = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
  prefix = {
    igw    = "igw"
    vpc    = "vpc"
    bu     = var.service
    env    = var.enviroment
    subnet = "snt"
    pub1    = "public1"
    prv1    = "private1"
    pub2    = "public1"
    prv2    = "private1"
  }
}