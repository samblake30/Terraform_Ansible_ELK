#Create Internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.My_VPC.id

  tags = {
    Name = "My VPC Internet Gateway"
  }

}
