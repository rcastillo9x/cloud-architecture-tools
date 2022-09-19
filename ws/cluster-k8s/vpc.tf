##################################################################################
# NETWORKING #
##################################################################################

### VPC FOR K8s

resource "aws_vpc" "cpmvpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  # Makes your instance shared on the host
  instance_tenancy = "default"

  # Required for EKS, Enable/disable DNS hostnames in the VPC
  enable_dns_support = true

  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name       = join("-", [local.prefix.bu, local.prefix.env, local.prefix.vpc])
    unit       = var.unit
    service    = var.service
    contact    = var.contact
    compliance = var.compliance
    enviroment = var.enviroment
  }
}

### VPC KEY PARAMETERS

output "vpc_id" {
  value       = aws_vpc.cpmvpc.id
  description = "vpc id"
  sensitive   = false

}
