locals {

   azones = {
    az    = "us-east-2"
    az_a    = "us-east-2a"
    az_b    = "us-east-2a"
    }
    
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
    pub1    = "public01"
    prv1    = "private01"
    pub2    = "public01"
    prv2    = "private01"
    eips    = "eips"
    natgw     = "natgw"
    nat1    = "natgw01"
    nat2    = "natgw02"
    rt     = "rt"
    rt1     = "rt01"
  }

 # CLUSTER K8S CONFIGURATION
  cluster = {
    name    = "${var.enviroment}-${var.service}-eks-cluster"
    version = "1.23"
    node_group_name = "${var.service}-nodes-general"
    }
   
}