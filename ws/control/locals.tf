locals {
  common_tags = {
    unit      = var.unit
    service   = var.service
    contact   = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
  prefix = {
    igw = "igw"
    vpc="vpc"
    bu=var.service
    env = var.enviroment
    subnet ="snt"
    pub = "public"
    prv ="private"
    }
}