##################################################################################
# NETWORKING #
##################################################################################

### Network Address Translation Gateway

resource "aws_nat_gateway" "ngw1" {
    # the allocation id of the elastic IP address for the gateway
    allocation_id = aws_eip.nat1.id
    # The subnet id 
    subnet_id = aws_subnet.pubsubnet1.id

    tags = {
    Name       = join("-", [local.prefix.nat1,local.prefix.bu, local.prefix.env, local.prefix.natgw])
    unit       = var.unit
    service    = var.service
    contact    = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
  
}

resource "aws_nat_gateway" "ngw2" {
    # the allocation id of the elastic IP address for the gateway
    allocation_id = aws_eip.nat2.id
    # The subnet id 
    subnet_id = aws_subnet.pubsubnet2.id

    tags = {
    Name       = join("-", [local.prefix.nat2,local.prefix.bu, local.prefix.env, local.prefix.natgw])
    unit       = var.unit
    service    = var.service
    contact    = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
  
}

