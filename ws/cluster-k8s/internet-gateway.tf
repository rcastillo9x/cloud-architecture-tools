##################################################################################
# NETWORKING #
##################################################################################

### INTERNET GATEWAY
resource "aws_internet_gateway" "cpmig" {
  vpc_id = aws_vpc.cpmvpc.id
  tags = {
    Name = join("-",[local.prefix.bu,local.prefix.env,local.prefix.igw])
    unit      = var.unit
    service   = var.service
    contact   = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
}