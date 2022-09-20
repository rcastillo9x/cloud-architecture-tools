##################################################################################
# TECH CONFIGURATION
##################################################################################

variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "us-east-2"
}

variable "enviroment" {
  type        = string
  description = "enviroment for AWS Resources"
  default     = "desa"
}


variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_pub_subnet_cidr_block" {
  type        = string
  description = "CIDR Block for public subnet in VPC"
  default     = "10.0.0.0/24"
}

variable "vpc_prv_subnet_cidr_block" {
  type        = string
  description = "CIDR Block for private subnet in VPC"
  default     = "10.0.1.0/24"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "instance_type" {
  type        = string
  description = "Type for EC2 Instnace"
  default     = "t2.micro"
}

##################################################################################
# BUSINESS CONFIGURATION
##################################################################################

variable "unit" {
  type        = string
  description = "unit name for resource tagging"
  default     = "cpm"
}

variable "service" {
  type        = string
  description = "service name for resource tagging"
}

variable "contact" {
  type        = string
  description = "Contact email for resource tagging"
}

variable "compliance" {
  type        = string
  description = "Type of Personally Identifiable Information : Normal | PII"
  default     = "PII"
}
