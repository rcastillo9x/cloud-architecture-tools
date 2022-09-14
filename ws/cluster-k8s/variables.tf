##################################################################################
# TECH CONFIGURATION
##################################################################################

variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "us-east-1"
}

variable "enviroment" {
  type        = string
  description = "enviroment for AWS Resources"
  default     = "us-east-1"
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
  description = "Type of compliance: Normal | PII"
  default     = "us-east-1"
}
