#Create the VPC
resource "aws_vpc" "My_VPC" {
  cidr_block           = var.vpccidr
  instance_tenancy     = var.instancetenancy
  enable_dns_support   = var.dnssupport
  enable_dns_hostnames = var.dnshostname

  tags = {
    Name = "My VPC"
  }

}

#Create the Subnet inside the VPC with Public IP assignment enabled to instances

resource "aws_subnet" "My_VPC_Subnet" {
  vpc_id                  = aws_vpc.My_VPC.id
  cidr_block              = var.subnetcidrblock
  map_public_ip_on_launch = var.mappublicip
  availability_zone       = var.az

  tags = {
    Name = "MY VPC SUBNET"
  }

}
