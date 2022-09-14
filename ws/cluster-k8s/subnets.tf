 
##################################################################################
# NETWORKING
##################################################################################

### PUBLIC SUBNET 1
### AZ: us-east-1a  CIDR 2: 10.0.1.0/24

resource "aws_subnet" "pubsubnet1" {
  cidr_block              = "10.0.1.0/246"
  vpc_id                  = aws_vpc.cpmvpc.id
  availability_zone       = "us-east-1a"
  # Required for EKS
  map_public_ip_on_launch = true


   tags = {
    "name" = join("-",[local.prefix.pub1,local.prefix.bu,local.prefix.env,local.prefix.subnet])
    "unit"  = var.unit
    "service"   = var.service
    "contact"   = var.contact
    "compliance" = var.compliance
    "enviroment" = var.enviroment
    # Required for EKS
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/eks" = "shared"
  }
}

### PUBLIC SUBNET 2
### AZ: us-east-1b  CIDR 2: 10.0.2.0/24
resource "aws_subnet" "pubsubnet2" {
  cidr_block              = "10.0.2.0/24"
  vpc_id                  = aws_vpc.cpmvpc.id
  availability_zone       = "us-east-1b"
# Required for EKS. 
  map_public_ip_on_launch = true


   tags = {
   "name" = join("-",[local.prefix.pub1,local.prefix.bu,local.prefix.env,local.prefix.subnet])
    "unit"  = var.unit
    "service"   = var.service
    "contact"   = var.contact
    "compliance" = var.compliance
    "enviroment" = var.enviroment
     # Required for EKS
    "kubernetes.io/role/elb"     = "1"
     "kubernetes.io/cluster/eks" = "shared"
  }
}


### PRIVATE SUBNET
### AZ: us-east-1a  CIDR 1: 10.0.3.0/24
resource "aws_subnet" "prvsubnet1" {
  cidr_block              = "10.0.3.0/24"
  vpc_id                  = aws_vpc.cpmvpc.id
  availability_zone       = "us-east-1a"

  # Required for EKS. 
  map_public_ip_on_launch = true

   tags = {
    "name" = join("-",[local.prefix.prv1,local.prefix.bu,local.prefix.env,local.prefix.subnet])
    "unit"  = var.unit
    "service"   = var.service
    "contact"   = var.contact
    "compliance" = var.compliance
    "enviroment" = var.enviroment
    # Reqyired for K8s
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/eks"      = "shared"
  }
}

### PRIVATE SUBNET
### AZ: us-east-1b  CIDR 1: 10.0.4.0/24
resource "aws_subnet" "prvsubnet2" {
  cidr_block              = "10.0.4.0/24"
  vpc_id                  = aws_vpc.cpmvpc.id
  # Required for EKS. Instances launched into the subnet
  map_public_ip_on_launch = true

   tags = {
    "name" = join("-",[local.prefix.prv2,local.prefix.bu,local.prefix.env,local.prefix.subnet])
    "unit"  = var.unit
    "service"   = var.service
    "contact"   = var.contact
    "compliance" = var.compliance
    "enviroment" = var.enviroment
    # Reqyired for K8s
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${var.enviroment}${var.unit}"      = "owned"
  }
}

*/