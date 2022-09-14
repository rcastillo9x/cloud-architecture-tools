###
# PRECONDICTIONS
###
# 
# BEFORE EXECUTING COMPLETE THE VARIABLE AND LOCAL FILES
#

##################################################################################
# OOMPUTE
##################################################################################


##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  shared_credentials_files = "~/.aws/credentials"
  region     = var.aws_region
}

##################################################################################
# DATA
##################################################################################

data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

##################################################################################
# RESOURCES
##################################################################################

# TODO: VPC ready
# TODO: IG ready
# TODO: SUBNET
# TODO: RT
# TODO: ACL
# TODO: SEG
# TODO: INSTANCE


# NETWORKING #
### VPC
resource "aws_vpc" "control_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    name = join("-",[local.prefix.bu,local.prefix.env,local.prefix.vpc])
    unit      = var.unit
    service   = var.service
    contact   = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
}

### INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.control_vpc.id
  tags = {
    name = join("-",[local.prefix.bu,local.prefix.env,local.prefix.igw])
    unit      = var.unit
    service   = var.service
    contact   = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
}

### PUBLIC SUBNET
resource "aws_subnet" "pub_subnet" {
  cidr_block              = var.vpc_pub_subnet_cidr_block
  vpc_id                  = aws_vpc.control_vpc.id
  map_public_ip_on_launch = var.map_public_ip_on_launch

   tags = {
    name = join("-",[local.prefix.pub,local.prefix.bu,local.prefix.env,local.prefix.subnet])
    unit      = var.unit
    service   = var.service
    contact   = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
}

### PRIVATE SUBNET

resource "aws_subnet" "prv_subnet" {
  cidr_block              = var.vpc_prv_subnet_cidr_block
  vpc_id                  = aws_vpc.control_vpc.id
  map_public_ip_on_launch = var.map_public_ip_on_launch

   tags = {
    name = join("-",[local.prefix.prv,local.prefix.bu,local.prefix.env,local.prefix.subnet])
    unit      = var.unit
    service   = var.service
    contact   = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
}


### PRIVATE SUBNET


/*
# ROUTING #
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = local.common_tags
}

resource "aws_route_table_association" "rta-subnet1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rtb.id
}

# SECURITY GROUPS #
# Nginx security group 
resource "aws_security_group" "nginx-sg" {
  name   = "nginx_sg"
  vpc_id = aws_vpc.vpc.id

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

# INSTANCES #
resource "aws_instance" "nginx1" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]

  user_data = <<EOF
#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
sudo rm /usr/share/nginx/html/index.html
echo '<html><head><title>Taco Team Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">You did it! Have a &#127790;</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
EOF

  tags = local.common_tags

}
*/