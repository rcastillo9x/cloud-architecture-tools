##################################################################################
# NETWORKING #
##################################################################################

### EXTERNAL IPS ADDRESS
resource "aws_eip" "nat1" {
    depends_on = [
      aws_internet_gateway.cpmig
    ]

    tags = {
    Name       = join("-", [local.prefix.nat1,local.prefix.bu, local.prefix.env, local.prefix.eips])
    unit       = var.unit
    service    = var.service
    contact    = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
  
}

### EXTERNAL IPS ADDRESS
resource "aws_eip" "nat2" {
    depends_on = [
      aws_internet_gateway.cpmig
    ]

    tags = {
    Name       = join("-", [local.prefix.nat2,local.prefix.bu, local.prefix.env, local.prefix.eips])
    unit       = var.unit
    service    = var.service
    contact    = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
  
}

