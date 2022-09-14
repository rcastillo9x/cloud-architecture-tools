##################################################################################
# NETWORKING #
##################################################################################

### INTERNET GATEWAY
resource "aws_internet_gateway" "cpmvpc" {
  vpc_id = aws_vpc.cpmvpc.id
  tags = {
    name = join("-",[local.prefix.bu,local.prefix.env,local.prefix.igw])
    unit      = var.unit
    service   = var.service
    contact   = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
}