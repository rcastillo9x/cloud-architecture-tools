
##################################################################################
# NETWORKING
##################################################################################

### PUBLIC SUBNET 
### AZ: us-east-2a  CIDR 2: 10.0.1.0/24

resource "aws_subnet" "pubsubnet1" {
  vpc_id            = aws_vpc.cpmvpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = local.azones.az_a
  # Required for EKS
  map_public_ip_on_launch = true


  tags = {
    Name         = join("-", [local.prefix.pub1, local.prefix.bu, local.prefix.env, local.prefix.subnet])
    "unit"       = var.unit
    "service"    = var.service
    "contact"    = var.contact
    "compliance" = var.compliance
    "enviroment" = var.enviroment
    # Required for EKS
    "kubernetes.io/role/elb"                      = "1"
    "kubernetes.io/cluster/${local.cluster.name}" = "shared"
  }
}

### PRIVATE SUBNET
### AZ: us-east-2a  CIDR 1: 10.0.3.0/24
resource "aws_subnet" "prvsubnet1" {
  vpc_id            = aws_vpc.cpmvpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = local.azones.az_a


  tags = {
    Name         = join("-", [local.prefix.prv1, local.prefix.bu, local.prefix.env, local.prefix.subnet])
    "unit"       = var.unit
    "service"    = var.service
    "contact"    = var.contact
    "compliance" = var.compliance
    "enviroment" = var.enviroment
    # Reqyired for K8s
    "kubernetes.io/cluster/${local.cluster.name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"

  }
}


### PUBLIC SUBNET 2
### AZ: us-east-2b  CIDR 2: 10.0.2.0/24
resource "aws_subnet" "pubsubnet2" {
  vpc_id            = aws_vpc.cpmvpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = local.azones.az_b
  # Required for EKS. 
  map_public_ip_on_launch = true


  tags = {
    Name         = join("-", [local.prefix.pub1, local.prefix.bu, local.prefix.env, local.prefix.subnet])
    "unit"       = var.unit
    "service"    = var.service
    "contact"    = var.contact
    "compliance" = var.compliance
    "enviroment" = var.enviroment
    # Required for EKS
    "kubernetes.io/cluster/${local.cluster.name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"

  }
}


### PRIVATE SUBNET
### AZ: us-east-2b  CIDR 1: 10.0.4.0/24
resource "aws_subnet" "prvsubnet2" {
  vpc_id            = aws_vpc.cpmvpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = local.azones.az_b

  tags = {
    Name         = join("-", [local.prefix.prv2, local.prefix.bu, local.prefix.env, local.prefix.subnet])
    "unit"       = var.unit
    "service"    = var.service
    "contact"    = var.contact
    "compliance" = var.compliance
    "enviroment" = var.enviroment
    # Reqyired for K8s
    "kubernetes.io/cluster/${local.cluster.name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}

