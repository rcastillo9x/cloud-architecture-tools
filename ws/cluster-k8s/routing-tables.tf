##################################################################################
# NETWORKING #
##################################################################################

### ROUTING TABLES

resource "aws_route_table" "pubrt" {
  depends_on = [
    aws_vpc.cpmvpc,
    aws_internet_gateway
  ]

  # The VPC id
  vpc_id = aws_vpc.cpmvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    
    # Identifier of internet gateway
    gateway_id = aws_internet_gateway.cpmig.id
  }

  tags = {
    Name       = join("-", [local.prefix.rt1, local.prefix.bu, local.prefix.env, local.prefix.rt])
    unit       = var.unit
    service    = var.service
    contact    = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }


}

resource "aws_route_table" "prvrt1" {
  depends_on = [
    aws_vpc.cpmvpc,
    aws_internet_gateway
  ]

  # The VPC id
  vpc_id = aws_vpc.cpmvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    # Identifier of a VPC Nat gateway
    nat_gateway_id = aws_nat_gateway.ngw1.id
  }

  tags = {
    Name = "private1-rt"
    unit       = var.unit
    service    = var.service
    contact    = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }


}

resource "aws_route_table" "prvrt2" {
  depends_on = [
    aws_vpc.cpmvpc,
    aws_internet_gateway
  ]

  # The VPC id
  vpc_id = aws_vpc.cpmvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    # Identifier of a VPC Nat gateway
    nat_gateway_id = aws_nat_gateway.ngw2.id
  }

  tags = {
    Name = "private2-rt"
    unit       = var.unit
    service    = var.service
    contact    = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }


}
