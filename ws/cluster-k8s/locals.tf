locals {
  # TAGS CONFIGURATION
  common_tags = {
    unit       = var.unit
    service    = var.service
    contact    = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }

  # GLOBAL VAR CONFIGURATION
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
    eips    = "eips"
    natgw     = "natgw"
    nat1    = "natgw1"
    nat2    = "natgw2"
    rt     = "rt"
    rt1     = "rt1"
  }

 # CLUSTER K8S CONFIGURATION
  cluster = {
    name    = "${var.enviroment}-${var.service}-eks-cluster"
    version = "1.22"
    }
   
}